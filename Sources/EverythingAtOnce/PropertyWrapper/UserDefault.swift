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

// Inspired by https://habr.com/ru/post/670378/

#if canImport(Foundation)
import Foundation
#endif

#if canImport(Combine)
import Combine
#endif

// MARK: Wrapper

#if canImport(Foundation)
/// Provides an API for a UserDefaults stored values.
@propertyWrapper public struct UserDefault<Value> {

	public var wrappedValue: Value {
		get {
			return getValue()
		}
		nonmutating set {
			setValue(newValue)
			valueChangePublisherInternal.send(newValue)
		}
	}

	#if canImport(Combine)
	/// Publishes wrapped value changes and only changes. Does **not** publish the initial value.
	public var valueChangePublisher: AnyPublisher<Value, Never> {
		return valueChangePublisherInternal.eraseToAnyPublisher()
	}

	private let valueChangePublisherInternal: PassthroughSubject<Value, Never> = .init()
	#endif

	/// Value getter.
	private let getValue: () -> Value

	/// Value setter.
	private let setValue: (Value) -> Void

}

// MARK: Standard types

extension UserDefault {

	/// Common init. Should be used for standard value types.
	private init<Key: UserDefaultKey>(
		defaultValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) {
		getValue = {
			if let value = storage.value(forKey: key.string) as? Value {
				return value
			} else {
				return defaultValue
			}
		}

		setValue = { newValue in
			storage.set(newValue, forKey: key.string)
		}
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Int {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Double {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == String {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Bool {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == URL {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Data {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard value.
	public init<Key: UserDefaultKey>(
		wrappedValue defaultValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value: Codable {
		getValue = {
			if
				let data = storage.value(forKey: key.string) as? Data,
				let value = try? JSONDecoder().decode(Value.self, from: data)
			{
				return value
			} else {
				return defaultValue

			}
		}

		setValue = { newValue in
			if let data = try? JSONEncoder().encode(newValue) {
				storage.set(data, forKey: key.string)
			}
		}
	}

}

// MARK: Nullable standard values

extension UserDefault where Value: ExpressibleByNilLiteral {

	/// Common init. Should be used for nullable standard value types.
	private init<WrappedType, Key: UserDefaultKey>(
		wrappedType: WrappedType.Type,
		_ key: Key,
		storage: UserDefaults = .standard
	) {
		getValue = {
			if let value = storage.value(forKey: key.string) as? Value {
				return value
			} else {
				return nil
			}
		}

		setValue = { newValue in
			if let newValue = newValue as? WrappedType? {
				storage.set(newValue, forKey: key.string)
			} else {
				storage.removeObject(forKey: key.string)
			}
		}
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Int? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Double? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == String? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Bool? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == URL? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for a standard nullable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == Data? {
		self.init(defaultValue: wrappedValue, key, storage: storage)
	}

}

// MARK: RawRepresentable values

extension UserDefault where Value: RawRepresentable {

	/// Common init. Should be used for enums and option sets.
	private init<Key: UserDefaultKey>(
		defaultValue: Value,
		key: Key,
		storage: UserDefaults
	) {
		getValue = {
			guard let rawValue = storage.value(forKey: key.string) as? Value.RawValue else {
				return defaultValue
			}

			if let value = Value(rawValue: rawValue) {
				return value
			}
			return defaultValue
		}

		setValue = { newValue in
			storage.set(newValue.rawValue, forKey: key.string)
		}
	}

	/// Creates a wrapper for UserDefaults storage for raw representable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value.RawValue == String {
		self.init(defaultValue: wrappedValue, key: key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for raw representable value.
	public init<Key: UserDefaultKey>(
		wrappedValue: Value,
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value.RawValue == Int {
		self.init(defaultValue: wrappedValue, key: key, storage: storage)
	}

}

// MARK: Nullable RawRepresentable values

extension UserDefault {

	/// Common init. Should be used for nullable enums and option sets.
	private init<V: RawRepresentable, Key: UserDefaultKey>(
		key: Key,
		storage: UserDefaults
	) where Value == V? {
		getValue = {
			if let rawValue = storage.value(forKey: key.string) as? V.RawValue {
				return V(rawValue: rawValue)
			} else {
				return nil
			}
		}

		setValue = { newValue in
			if let newValue = newValue as V? {
				storage.set(newValue.rawValue, forKey: key.string)
			} else {
				storage.removeObject(forKey: key.string)
			}
		}
	}

	/// Creates a wrapper for UserDefaults storage for nullable raw representable value.
	public init<R: RawRepresentable, Key: UserDefaultKey>(
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == R?, R.RawValue == Int {
		self.init(key: key, storage: storage)
	}

	/// Creates a wrapper for UserDefaults storage for nullable raw representable value.
	public init<R: RawRepresentable, Key: UserDefaultKey>(
		_ key: Key,
		storage: UserDefaults = .standard
	) where Value == R?, R.RawValue == String {
		self.init(key: key, storage: storage)
	}

}
#endif

// MARK: - SwiftUI

#if canImport(SwiftUI)
import SwiftUI

extension UserDefault: DynamicProperty {

}
#endif
