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

// MARK: Picsum

/// Generator for mock image URLs.
public enum Picsum {

	// MARK: Exposed properties

	/// Generator seed. Use to retrieve the same image every time.
	public static let defaultSeed: String = "everything-at-once.picsum.seed.default"

	// MARK: Private methods

	/// Base URL for picsum photos.
	private static let baseURL: URL = URL(string: "https://picsum.photos")!

	// MARK: Exposed methods

	/// Random image URL from https://picsum.photos.
	public static func random(
		width: Int? = nil,
		height: Int? = nil,
		useSeed seed: String? = nil
	) -> URL {
		return baseURL
			.appending(seedComponent(seed: seed))
			.appending(sizeComponent(widthOrHeight: height ?? .random(in: 200...2000)))
			.appending(sizeComponent(widthOrHeight: width ?? .random(in: 200...2000)))
	}

	/// Random 200x200 image URL.
	///
	/// Use a seed to retrieve the same image everytime.
	public static func random200x200(useSeed seed: String? = nil) -> URL {
		return random(width: 200, height: 200, useSeed: seed)
	}

	/// Random 375x667 image URL.
	///
	/// Use a seed to retrieve the same image everytime.
	public static func random375x667(useSeed seed: String? = nil) -> URL {
		return random(width: 375, height: 667, useSeed: seed)
	}

	/// Random 800x600 image URL.
	///
	/// Use a seed to retrieve the same image everytime.
	public static func random800x600(useSeed seed: String? = nil) -> URL {
		return random(width: 800, height: 600, useSeed: seed)
	}

	/// Random 1024x1024 image URL.
	///
	/// Use a seed to retrieve the same image everytime.
	public static func random1024x1024(useSeed seed: String? = nil) -> URL {
		return random(width: 1024, height: 1024, useSeed: seed)
	}

	/// Random 2560x1600 image URL.
	///
	/// Use a seed to retrieve the same image everytime.
	public static func random2560x1600(useSeed seed: String? = nil) -> URL {
		return random(width: 2560, height: 1600, useSeed: seed)
	}

	// MARK: Private methods

	/// Size component in format */VALUE*.
	private static func sizeComponent(widthOrHeight value: Int? = nil) -> String {
		if let value {
			return String(describing: value)
		}
		return ""
	}

	/// Size component in format */seed/SEED*.
	private static func seedComponent(seed: String? = nil) -> String {
		return "seed/" + (seed ?? Picsum.defaultSeed)
	}

}
#endif
