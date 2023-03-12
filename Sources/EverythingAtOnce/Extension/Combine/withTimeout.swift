//
//
//  MIT License
//
//  Copyright (c) 2022-Present EverythingAtOnce
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//  

#if canImport(Foundation)
import Foundation

// MARK: - Method

/// Executes an operation in the current task subject to a timeout.
///
/// - Parameters:
///   - seconds: The duration in seconds `operation` is allowed to run before timing out.
///   - timeoutError: The custom error that thrown after the timeout expires.
///   - operation: The async operation to perform.
/// - Returns: Returns the result of `operation` if it completed in time.
/// - Throws: Throws provided error if the timeout expires before `operation` completes.
///   If `operation` throws an error before the timeout expires, that error is propagated to the caller.
func withTimeout<Result, TimeoutError: Error>(
	seconds: TimeInterval,
	timeoutError: TimeoutError,
	operation: @escaping @Sendable () async throws -> Result
) async throws -> Result {
	return try await withThrowingTaskGroup(of: Result.self) { group in
		let deadline = Date(timeIntervalSinceNow: seconds)

		group.addTask {
			return try await operation()
		}

		group.addTask {
			let timeoutInterval = deadline.timeIntervalSinceNow
			if timeoutInterval > 0 {
				try await Task.sleep(nanoseconds: UInt64(timeoutInterval * 1_000_000_000))
			}
			try Task.checkCancellation()
			throw timeoutError
		}

		// It is guaranteed that when the execution reaches this line,
		// the operation task is finished first, otherwise
		// timeout error will be thrown from the timeout task.
		let result = try await group.next()!

		// Cancel timeout task.
		group.cancelAll()

		return result
	}
}
#endif
