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

// MARK: - Clamping

/// Clamping of a value. Transforms a wrapped value to fit the specified bounds.
///
/// If a clamping misses either lower or upper bound, it will be "replaced" with +/- infinity.
///
/// Example:
/// ```
/// struct Weather {
///     @Clamped(0...100) humidity: Int
/// }
///
/// let weather = Weather(humidity: 146)
/// print(weather.humidity) // "100"
/// print(weather.$humidity.value) // "146"
/// ```
@propertyWrapper public struct Clamping<Value: Comparable> {

	// MARK: Exposed properties

	/// Lower bound of a clamping.
	public let lowerBound: Value?

	/// Upper bound of a clamping.
	public let upperBound: Value?

	/// Raw value of a clamping
	public private(set) var value: Value

	public var wrappedValue: Value {
		get { clamped(value) }
		set { value = newValue }
	}

	public var projectedValue: Clamping {
		return self
	}

	// MARK: Init

	/// Creates a clamping of a value.
	///
	/// - Parameters:
	///   - wrappedValue: Value to clamp.
	///   - lowerBound: Minimum value.
	public init(wrappedValue: Value, from lowerBound: Value) {
		self.lowerBound = lowerBound
		self.upperBound = nil
		self.value = wrappedValue
	}

	/// Creates a clamping of a value.
	///
	/// - Parameters:
	///   - wrappedValue: Value to clamp.
	///   - upperBound: Maximum value.
	public init(wrappedValue: Value, to upperBound: Value) {
		self.lowerBound = nil
		self.upperBound = upperBound
		self.value = wrappedValue
	}

	/// Creates a clamping of a value.
	///
	/// - Parameters:
	///   - wrappedValue: Value to clamp.
	///   - lowerBound: Minimum value.
	///   - upperBound: Maximum value.
	public init(wrappedValue: Value, from lowerBound: Value, to upperBound: Value) {
		guard lowerBound < upperBound else {
			fatalError("Lowerbound \(lowerBound) is not less than upperbound \(upperBound).")
		}
		self.lowerBound = lowerBound
		self.upperBound = upperBound
		self.value = wrappedValue
	}

	/// Creates a clamping of a value.
	///
	/// - Parameters:
	///   - wrappedValue: Value to clamp.
	///   - range: Clamping range.
	public init(wrappedValue: Value, _ range: ClosedRange<Value>) {
		self.init(wrappedValue: wrappedValue, from: range.lowerBound, to: range.upperBound)
	}

	// MARK: Private methods

	/// Consider the lower bound if needed.
	private func clampedUp(_ newValue: Value) -> Value {
		if let lowerbound = lowerBound {
			return max(newValue, lowerbound)
		} else {
			return newValue
		}
	}

	/// Consider the upper bound if needed.
	private func clampedDown(_ newValue: Value) -> Value {
		if let upperbound = upperBound {
			return min(newValue, upperbound)
		} else {
			return newValue
		}
	}

	/// Consider both lower and upper bounds if needed.
	private func clamped(_ newValue: Value) -> Value {
		return clampedUp(clampedDown(newValue))
	}

}
#endif
