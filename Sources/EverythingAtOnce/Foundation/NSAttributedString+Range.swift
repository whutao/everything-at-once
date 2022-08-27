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
    
    
    /// Full range of the string text.
    public var fullRange: NSRange {
        return NSRange(location: 0, length: length)
    }
    
    /// Inspects a string for the occurences of a regex pattern, and returns a list of ranges.
    ///
    /// - Parameters:
    ///   - pattern: Regex pattern. Can be a simple substring.
    ///   - options: Regex options. Empty set by default.
    /// - Returns: A list of matching result ranges.
    public func ranges(of pattern: String, options: NSRegularExpression.Options) throws -> Array<NSRange> {
        return try string.ranges(of: pattern, options: options)
    }
    
}
#endif
