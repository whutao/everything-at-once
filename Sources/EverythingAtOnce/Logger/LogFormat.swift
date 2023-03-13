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
/// Logger output format.
public struct LogFormat {
	
	// MARK: Exposed properties
	
	/// Default format with extensive format.
	public static let `default`: LogFormat = LogFormat(arguments: [
		.leftBracket, .date, .rightBracket,
		.space(), .logLevelSymbol, .space(), .logLevel, .space(),
		.leftParanthesis,
		.fileName, .comma,
		.space(), .functionName, .comma,
		.space(), .text("line"),
		.space(), .lineNumber,
		.rightParanthesis,
		.space(), .dash, .space(), .text("\""), .logString, .text("\"")
	])
	
	/// Format arguments.
	public let arguments: [LogFormatElement]
	
	// MARK: Init
	
	/// Creates a format from arguments.
	public init(arguments: [LogFormatElement]) {
		self.arguments = arguments
	}
	
	// MARK: Exposed methods
	
	/// Transform log event into a string using format.
	public func format(
		string: String,
		level: LogLevel,
		dateFormat: String,
		functionName: String,
		fileName: String,
		lineNumber: Int
	) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter .dateFormat = dateFormat
		return arguments.map { element -> String in
			switch element {
			case .date:
				return dateFormatter.string(from: Date())
			case .threadName:
				return Thread.current.name ?? "*unknown*"
			case .functionName:
				return String(describing: functionName)
			case .fileName:
				return String(describing: fileName)
			case .lineNumber:
				return String(describing: lineNumber)
			case .logLevel:
				return level.name.uppercased()
			case .logLevelSymbol:
				return level.symbol
			case .logString:
				return string
			case .dot:
				return "."
			case .comma:
				return ","
			case .dash:
				return "-"
			case .space(count: let count):
				return String(repeating: " ", count: count)
			case .newLine(count: let count):
				return String(repeating: "\n", count: count)
			case .leftParanthesis:
				return "("
			case .leftBracket:
				return "["
			case .rightParanthesis:
				return ")"
			case .rightBracket:
				return "]"
			case .text(let text):
				return text
			}
		}
		.joined(separator: .emptyString)
	}
	
}
#endif
