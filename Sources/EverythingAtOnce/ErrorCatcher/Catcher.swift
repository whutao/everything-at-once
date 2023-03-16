//
//
//  MIT License
//
//  Copyright (c) 2023-Present EverythingAtOnce
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

// MARK: - Class

/// Error handler class. Use it for general error handling in the application.
/// Error actions are applied in the order they set up on the instance.
///
/// Example:
/// ```
/// let catcher = Catcher()
///
/// catcher.on(NetworkError.noConnection) {
/// 	// Show "no internet toast"
/// }
///
/// catcher.onType(AuthorizationError.self) {
/// // Display alert.
/// }
///
/// catcher.on({ ($0 as? NSError)?.domain == "database" }) {
/// // Display alert.
/// }
///
/// await tryWith(catcher) {
/// 	try await api.getDashboardInfo()
/// }
/// ```
open class Catcher {
	
	// MARK: Policy
	
	/// Catcher search step result policy.
	public enum Policy {
		
		/// Catcher did not detect an error category and should continue searching
		case proceed
		
		/// Catcher detected an error category and should stop its flow.
		case stop
		
	}
	
	// MARK: Typealias
	
	public typealias HandleAction = (Error) -> Policy
	
	// MARK: Private properties
	
	private var alwaysActions: [HandleAction] = []
	
	private var noMatchActions: [HandleAction] = []
	
	private var errorActions: [(ErrorCategory, HandleAction)] = []
	
	// MARK: Init
	
	/// Creates an instance of a catcher.
	public init() {
		
	}
	
	// MARK: Handle
	
	/// Considers an error for the matches until the first `Policy.stop` is received.
	///
	/// The order is:
	/// 1. Error actions.
	/// 2. Not found actions
	/// 3. Always actions
	public func handle(_ error: Error) {
		defer {
			for action in alwaysActions.reversed() {
				if case .stop = action(error) {
					break
				}
			}
		}
		
		var isCategoryFound: Bool = false
		for (category, action) in errorActions.reversed() {
			if category.includes(error) {
				isCategoryFound = true
				if case .stop = action(error) {
					return
				}
			}
		}
		
		guard not(isCategoryFound) else { return }
		
		for action in noMatchActions.reversed() {
			if case .stop = action(error) {
				return
			}
		}
	}
	
	// MARK: "On" methods
	
	/// Adds an action to be performed when an error satisfies a category.
	@discardableResult open func on(
		_ category: ErrorCategory,
		do action: @escaping HandleAction
	) -> Self {
		errorActions.append((category, action))
		return self
	}
	
	/// Adds an action to be performed when an error matches a certain boolean condition.
	@discardableResult open func on(
		matches: @escaping (Error) -> Bool,
		do action: @escaping HandleAction
	) -> Self {
		return on(ClosureErrorCategory(includes: matches), do: action)
	}
	
	/// Adds an action to be performed when error does not match any stored category.
	@discardableResult open func onNoMatch(
		do action: @escaping HandleAction
	) -> Self {
		noMatchActions.append(action)
		return self
	}
	
	/// Adds an action to be performed on any handling (regardless the fact that error is detected or not).
	@discardableResult open func always(
		do action: @escaping HandleAction
	) -> Self {
		alwaysActions.append(action)
		return self
	}
	
	/// Adds an action to be performed when error matches a specified type.
	@discardableResult open func onType<ErrorKind: Error>(
		_ errorKind: ErrorKind.Type,
		do action: @escaping HandleAction
	) -> Self {
		return on(TypeErrorCategory<ErrorKind>(), do: action)
	}
	
	/// Adds an action to be performed when error exactly equals the specified one.
	@discardableResult open func on<ErrorKind: Error & Equatable>(
		_ error: ErrorKind,
		do action: @escaping HandleAction
	) -> Self {
		return on(matches: { $0 as? ErrorKind == error }, do: action)
	}
	
}
#endif
