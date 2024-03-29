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

// MARK: - Wrapper

/// Property wrapper that trims a string.
///
/// Example:
/// ```
/// struct Person {
///     @Trimmed name: String
///     @Trimmed surname: String
/// }
///
/// let person = Person(name: "Star  ", surname: "   Butterfly ")
/// print(person.$name.value) // "Star  "
/// print(person.name) // "Star"
/// print(person.surname) // "Butterfly"
/// ```
@propertyWrapper public struct Trimmed {
	
	// MARK: Exposed properties
	
	/// Raw string value.
	public private(set) var value: String
	
	public var wrappedValue: String {
		get { value.trimmingCharacters(in: characterSet) }
		set { value = newValue  }
	}
	
	public var projectedValue: Trimmed {
		return self
	}
	
	// MARK: Private properties
	
	private let characterSet: CharacterSet
	
	// MARK: Init
	
	/// Creates an instance of a property wrapper.
	public init(
		wrappedValue: String,
		in characterSet: CharacterSet = .whitespacesAndNewlines
	) {
		self.value = wrappedValue
		self.characterSet = characterSet
	}
	
}
#endif
