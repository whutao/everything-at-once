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

/// Operator notation for *not*.
///
/// - Parameters:
///   - predicate: A predicate.
/// - Returns: A compound predicate as a negation of the given one.
public prefix func ! (_ predicate: NSPredicate) -> NSCompoundPredicate {
	return predicate.not
}

/// Operator notation for *and*.
///
/// - Parameters:
///   - lhs: First predicate.
///   - rhs: Second predicate.
/// - Returns: A compound predicate as a combination of the given ones.
public func && (_ lhs: NSPredicate, _ rhs: NSPredicate) -> NSCompoundPredicate {
	return lhs.and(rhs)
}

/// Operator notation for *or*.
///
/// - Parameters:
///   - lhs: First predicate.
///   - rhs: Second predicate.
/// - Returns: A compound predicate as a combination of the given ones.
public func || (_ lhs: NSPredicate, _ rhs: NSPredicate) -> NSCompoundPredicate {
	return lhs.or(rhs)
}
#endif
