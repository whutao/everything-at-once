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

extension Sequence {

	/// Returns the elements of the sequence, sorted in the increasing order using the given keypath.
	public func sorted<Value: Comparable>(
		by keyPath: KeyPath<Self.Element, Value>
	) -> [Self.Element] {
		return self.sorted(by: keyPath, using: <)
	}

	/// Returns the elements of the sequence, sorted in the increasing order using the given keypath.
	public func sorted<Value: Comparable>(
		by keyPath1: KeyPath<Self.Element, Value>,
		and keyPath2: KeyPath<Self.Element, Value>
	) -> [Self.Element] {
		return self.sorted(by: keyPath1, and: keyPath2, using: <)
	}

	/// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements and the keypath.
	public func sorted<Value>(
		by keyPath: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
	) rethrows -> [Self.Element] {
		return try self.sorted {
			try valuesAreInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
		}
	}

	/// Returns the elements of the sequence, sorted using the given predicate as the comparison between elements, the keypath and the suplementary keypath.
	public func sorted<Value: Comparable>(
		by keyPath1: KeyPath<Self.Element, Value>,
		and keyPath2: KeyPath<Self.Element, Value>,
		using valuesAreInIncreasingOrder: (Value, Value) throws -> Bool
	) rethrows -> [Self.Element] {
		return try self.sorted {
			if $0[keyPath: keyPath1] == $1[keyPath: keyPath1] {
				return try valuesAreInIncreasingOrder($0[keyPath: keyPath2], $1[keyPath: keyPath2])
			} else {
				return try valuesAreInIncreasingOrder($0[keyPath: keyPath1], $1[keyPath: keyPath1])
			}
		}
	}

}
