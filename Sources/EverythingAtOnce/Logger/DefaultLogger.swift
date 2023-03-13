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

// MARK: - Format

#if canImport(Foundation)
/// Standard primitive logger.
public final class DefaultLogger: LoggerProtocol {

	// MARK: Exposed properties

	public var isEnabled: Bool = false

	// MARK: Private properties

	private var destinations: [LoggerDestinationProtocol] = []

	private let logFormat: LogFormat

	private let dateFormat: String

	// MARK: Init

	public init(
		logFormat: LogFormat = .default,
		dateFormat: String = "yyyy-MM-dd HH:mm:ss"
	) {
		self.logFormat = logFormat
		self.dateFormat = dateFormat
	}

	// MARK: Exposed methods

	public func log(
		_ message: @autoclosure @escaping () -> Any?,
		level: LogLevel,
		fileName: StaticString,
		functionName: StaticString,
		lineNumber: Int
	) {
		guard isEnabled else { return }

		let message: String = {
			if let text = message() {
				return String(describing: text)
			} else {
				return "nil"
			}
		}()

		let fileName: String = {
			if let fileNameComponent = String(describing: fileName).split(separator: "/").last {
				return String(fileNameComponent)
			} else {
				return String(describing: fileName)
			}
		}()

		let string = logFormat.format(
			string: message,
			level: level,
			dateFormat: dateFormat,
			functionName: String(describing: functionName),
			fileName: fileName,
			lineNumber: lineNumber
		)

		destinations
			.filter({ $0.outputLevel <= level })
			.forEach({ destination in
				destination.process(
					string: string,
					level: level
				)
			})
	}

	public func addDestination(_ destination: LoggerDestinationProtocol) {
		destinations.append(destination)
	}

}
#endif
