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
/// Log levels ordered according to their prioriry.
///
/// The order is *verbose -> info -> debug -> warning -> error -> severe*.
public enum LogLevel: UInt8, Comparable {

	// MARK: Exposed properties

	public var name: String {
		switch self {
		case .verbose:
			return "verbose"
		case .info:
			return "info"
		case .debug:
			return "debug"
		case .warning:
			return "warning"
		case .error:
			return "error"
		case .severe:
			return "severe"
		}
	}

	public var symbol: String {
		switch self {
		case .verbose:
			return "🔈"
		case .info:
			return "ℹ️"
		case .debug:
			return "🪲"
		case .warning:
			return "⚠️"
		case .error:
			return "⛔️"
		case .severe:
			return "🔥"
		}
	}

	// MARK: Cases

	case verbose = 0

	case info = 1

	case debug = 2

	case warning = 3

	case error = 4

	case severe = 5

	// MARK: Exposed methods

	public static func < (lhs: LogLevel, rhs: LogLevel) -> Bool {
		return lhs.rawValue < rhs.rawValue
	}

}
#endif
