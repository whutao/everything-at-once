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


// MARK: String

#if canImport(Foundation)
import Foundation


extension Optional where Wrapped == String {
    
    
    /// Returns `true` if an optional contains a non-empty string value, `false` otherwise.
    ///
    /// A convenient way to write, for example:
    /// ```
    /// let optionalString: String? = ""
    ///
    /// print(optionalString.isNilOrEmpty)
    /// ```
    /// instead of:
    /// ```
    /// let optionalString: String? = ""
    ///
    /// print(optionalString == nil || optionalString == "")
    /// ```
    public var isNilOrEmpty: Bool {
        
        if let string = self {
            return string.isEmpty
        }
        
        return true
        
    }
    
}
#endif


// MARK: Collection

extension Optional where Wrapped: Collection {
    
    
    /// Returns `true` if an optional contains a non-empty string value, `false` otherwise.
    ///
    /// A convenient way to write, for example:
    /// ```
    /// let optionalCollection: Array<Int>? = []
    ///
    /// print(optionalCollection.isNilOrEmpty)
    /// ```
    /// instead of:
    /// ```
    /// let optionalCollection: Array<Int>? = []
    ///
    /// print(optionalCollection == nil || optionalCollection == [])
    /// ```
    public var isNilOrEmpty: Bool {
        
        if let collection = self {
            return collection.isEmpty
        }
        
        return true
        
    }
    
}
