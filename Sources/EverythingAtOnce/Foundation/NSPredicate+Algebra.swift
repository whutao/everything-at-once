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

#if canImport(Foundation)
import Foundation

// MARK: Convenience

extension NSCompoundPredicate {

	/// Returns a new predicate formed by applying *not* operator to the given predicate.
	public convenience init(not nsPredicate: NSPredicate) {
		self.init(notPredicateWithSubpredicate: nsPredicate)
	}

	/// Returns a new predicate formed by applying *and* operator to the given predicates.
	public convenience init(and nsPredicates: NSPredicate...) {
		self.init(andPredicateWithSubpredicates: nsPredicates)
	}

	/// Returns a new predicate formed by applying *or* operator to the given predicates.
	public convenience init(or nsPredicates: NSPredicate...) {
		self.init(orPredicateWithSubpredicates: nsPredicates)
	}

}

// MARK: Boolean algebra

extension NSPredicate {

	/// Returns a new predicate formed by applying *not* operator to the current predicate.
	public var not: NSCompoundPredicate {
		return NSCompoundPredicate(not: self)
	}

	/// Returns a new predicate formed by applying *and* operator to the current predicate and the argument.
	///
	/// - Parameter predicate: Some NSPredicate.
	/// - Returns: Produced NSCompoundPredicate.
	public func and(_ predicate: NSPredicate) -> NSCompoundPredicate {
		return NSCompoundPredicate(and: self, predicate)
	}

	/// Returns a new predicate formed by applying *or* operator to the current predicate and the argument.
	///
	/// - Parameter predicate: Some NSPredicate.
	/// - Returns: Produced NSCompoundPredicate.
	public func or(_ predicate: NSPredicate) -> NSCompoundPredicate {
		return NSCompoundPredicate(or: self, predicate)
	}

}
#endif
