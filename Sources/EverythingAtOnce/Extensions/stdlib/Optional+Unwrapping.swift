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

extension Optional {

	/// Instead of bare `??` operator.
	///
	/// A convenient way to write:
	/// ```
	/// let optionalString: String? = nil
	///
	/// print(optionalString.unwrapped(or: "Default string"))
	/// ```
	/// instead of:
	/// ```
	/// let optionalString: String? = nil
	///
	/// print(optionalString ?? "Default string")
	/// ```
	public func unwrapped(or defaultValue: Wrapped) -> Wrapped {

		if let wrapped = self {
			return wrapped
		}

		return defaultValue

	}

	/// Instead of the bare`!` force unwrap operator.
	///
	/// A convenient way to write:
	/// ```
	/// let optionalString: String? = "String"
	///
	/// print(optionalString.forceUnwrapped(because: "Always not nil."))
	/// ```
	/// instead of:
	/// ```
	/// let optionalString: String? = "String"
	///
	/// // Always not nil.
	/// print(optionalString!)
	/// ```
	public func forceUnwrapped(because assumption: String) -> Wrapped {

		if let wrapped = self {
			return wrapped
		}

		fatalError("Unexpectedly found nil. Failed assumption: \(assumption).")

	}

	/// Returns a wrapped value if an optional can be unwrapped. Otherwise, throw an `error`.
	public func unwrapped(or error: Error) throws -> Wrapped {

		if let wrapped = self {
			return wrapped
		}

		throw error

	}

}
