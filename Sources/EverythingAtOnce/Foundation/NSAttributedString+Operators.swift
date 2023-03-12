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

extension NSAttributedString {

	/// Adds an attributed string to another attribued string, producing a new attributed string.
	///
	/// - Parameters:
	///   - lhs: First attributed string.
	///   - rhs: Second attributed string.
	/// - Returns: A new instance as a combination of 2 strings.
	public static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
		let string = NSMutableAttributedString(attributedString: lhs)
		string.append(rhs)
		return string
	}

	/// Adds an attributed string to a usual string, producing a new attributed string.
	///
	/// - Parameters:
	///   - lhs: First attributed string.
	///   - rhs: Second normal string.
	/// - Returns: A new instance as a combination of 2 strings.
	public static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
		return lhs + NSAttributedString(string: rhs)
	}

	/// Adds a usual string to an attributed string, producing a new attributed string.
	///
	/// - Parameters:
	///   - lhs: First normal string.
	///   - rhs: Second attributed string.
	/// - Returns: A new instance as a combination of 2 strings.
	public static func + (lhs: String, rhs: NSAttributedString) -> NSAttributedString {
		return NSAttributedString(string: lhs) + rhs
	}

}
#endif
