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
#endif

// MARK: - Logger

#if canImport(Foundation)
/// Interface to work with logger.
public protocol LoggerProtocol {

	// MARK: Properties

	/// True if a logger is able to log events now.
	var isEnabled: Bool { get set }

	// MARK: Methods

	/// Sends a log event.
	func log(
		_ message: @autoclosure @escaping () -> Any?,
		level: LogLevel,
		fileName: StaticString,
		functionName: StaticString,
		lineNumber: Int
	)

	/// Adds a destination for log messages.
	func addDestination(_ destination: LoggerDestinationProtocol)

}
#endif

// MARK: - Log by level

#if canImport(Foundation)
extension LoggerProtocol {

	/// Sends verbose message.
	public func verbose(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .verbose,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

	/// Sends info message.
	public func info(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .info,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

	/// Sends debug message.
	public func debug(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .debug,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

	/// Sends warning message.
	public func warning(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .warning,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

	/// Sends error message.
	public func error(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .error,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

	/// Sends severe error message.
	public func severe(
		_ message: @autoclosure @escaping () -> Any?,
		fileName: StaticString = #file,
		functionName: StaticString = #function,
		lineNumber: Int = #line
	) {
		log(
			message,
			level: .severe,
			fileName: fileName,
			functionName: functionName,
			lineNumber: lineNumber
		)
	}

}
#endif
