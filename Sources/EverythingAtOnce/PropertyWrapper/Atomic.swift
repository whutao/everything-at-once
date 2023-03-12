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

// MARK: - Property wrapper

/// Atomic property can be safely read and written from different threads by sacrificing an access speed.
@propertyWrapper public struct Atomic<Value> {

	// MARK: Exposed properties

	/// Getter and setter for the wrapped value.
	public var wrappedValue: Value {
		get { lock.perform { value } }
		set { lock.perform { value = newValue } }
	}

	public var projectedValue: Atomic<Value> {
		return self
	}

	// MARK: Private properties

	/// Lock used to synchronize reads and writes.
	///
	/// As reads and writes are done fast, the *os_unfair_lock* will demonstrate the best performance here.
	private let lock = UnfairLock()

	/// Wrapped value to be read/written.
	private var value: Value

	// MARK: Init

	public init(wrappedValue: Value) {
		self.value = wrappedValue
	}

}
#endif
