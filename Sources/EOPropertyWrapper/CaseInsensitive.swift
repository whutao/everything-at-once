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
        

import Foundation


/// Property wrapper that trims a string.
///
/// Example:
/// ```
/// struct Person {
///     @CaseInsensitive nickname: String
/// }
///
/// let mikeVazovski = Person(name: "Mike")
/// let mikeTyson = Person(name: "mike")
/// print(mikeTyson.nickname == mikeTyson.nickname) // "true"
/// ```
@propertyWrapper public struct CaseInsensitive<S: StringProtocol> {
    
    /// Creates a case insensitive string property wrapper.
    ///
    /// - Parameters:
    ///   - wrappedValue: String representable value.
    public init(wrappedValue: S) {
        self.wrappedValue = wrappedValue
    }
    
    public var wrappedValue: S
    
    public var projectedValue: CaseInsensitive {
        return self
    }
    
}


// MARK: Comparable

extension CaseInsensitive: Comparable {
    
    private func compare(with other: CaseInsensitive) -> ComparisonResult {
        wrappedValue.caseInsensitiveCompare(other.wrappedValue)
    }
    
    public static func == (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(with: rhs) == .orderedSame
    }
    
    public static func < (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(with: rhs) == .orderedAscending
    }
    
    public static func > (lhs: CaseInsensitive, rhs: CaseInsensitive) -> Bool {
        lhs.compare(with: rhs) == .orderedDescending
    }
    
}
