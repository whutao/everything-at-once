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

#if canImport(CoreGraphics)
import CoreGraphics

extension CGAffineTransform {

	/// Returns an affine transformation matrix constructed from translation values you provide.
	public static func translate<Value: BinaryFloatingPoint>(
		x: Value,
		y: Value
	) -> CGAffineTransform {
		return CGAffineTransform(translationX: CGFloat(x), y: CGFloat(y))
	}

	/// Returns an affine transformation matrix constructed from a rotation value you provide.
	public static func rotate<Value: BinaryFloatingPoint>(
		angle: Value
	) -> CGAffineTransform {
		return CGAffineTransform(rotationAngle: CGFloat(angle))
	}

	/// Returns an affine transformation matrix constructed from scaling values you provide.
	public static func scale<Value: BinaryFloatingPoint>(
		x: Value,
		y: Value
	) -> CGAffineTransform {
		return CGAffineTransform(scaleX: CGFloat(x), y: CGFloat(y))
	}

	/// Returns an affine transformation matrix constructed from scaling values you provide.
	public static func scale<Value: BinaryFloatingPoint>(
		_ value: Value
	) -> CGAffineTransform {
		return scale(x: value, y: value)
	}

}
#endif
