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

// MARK: Transforms

#if canImport(QuartzCore)
import QuartzCore

extension CATransform3D {

	/// Rotates this transform by angle along the vector (x, y, z).
	///
	/// - Parameters:
	///   - angle: Rotation angle.
	///   - x: X value of a vector.
	///   - y: Y value of a vector.
	///   - z: Z value of a vector.
	/// - Returns: A rotated transform.
	@inlinable public func rotated(
		by angle: CGFloat,
		x: CGFloat,
		y: CGFloat,
		z: CGFloat
	) -> CATransform3D {
		return CATransform3DRotate(self, angle, x, y, z)
	}

	/// Translates this transform by vector (dx, dy, dz).
	///
	/// - Parameters:
	///   - dx: Translation along X axis.
	///   - dy: Translation along Y axis.
	///   - dz: Translation along Z axis.
	/// - Returns: A translated transform.
	@inlinable public func translated(
		dx: CGFloat,
		dy: CGFloat,
		dz: CGFloat
	) -> CATransform3D {
		return CATransform3DTranslate(self, dx, dy, dz)
	}

	/// Scales this transform by values along each axis.
	///
	/// - Parameters:
	///   - x: Scale along X axis.
	///   - y: Scale along Y axis.
	///   - z: Scale along Z axis.
	/// - Returns: A scaled transform.
	@inlinable public func scaled(
		x: CGFloat,
		y: CGFloat,
		z: CGFloat
	) -> CATransform3D {
		return CATransform3DScale(self, x, y, z)
	}

	/// Scales this transform by same value along each axis.
	///
	/// - Parameters:
	///   - value: Scale factor.
	/// - Returns: A scaled transform.
	@inlinable public func scaled(by value: CGFloat) -> CATransform3D {
		return scaled(x: value, y: value, z: value)
	}

}

// MARK: Factory

extension CATransform3D {

	/// A rotation transform by angle along the vector (x, y, z).
	///
	/// - Parameters:
	///   - angle: Rotation angle.
	///   - x: X value of a vector.
	///   - y: Y value of a vector.
	///   - z: Z value of a vector.
	/// - Returns: A transform.
	@inlinable public static func rotate(
		by angle: CGFloat,
		x: CGFloat,
		y: CGFloat,
		z: CGFloat
	) -> CATransform3D {
		return CATransform3DIdentity.rotated(by: angle, x: x, y: y, z: z)
	}

	/// A translation transform by shift values along each axis.
	///
	/// - Parameters:
	///   - dx: Translation along X axis.
	///   - dy: Translation along Y axis.
	///   - dz: Translation along Z axis.
	/// - Returns: A transform.
	@inlinable public static func translate(
		dx: CGFloat,
		dy: CGFloat,
		dz: CGFloat
	) -> CATransform3D {
		return CATransform3DIdentity.translated(dx: dx, dy: dy, dz: dz)
	}

	/// A scale transform by scale values along each axis.
	///
	/// - Parameters:
	///   - dx: Scale along X axis.
	///   - dy: Scale along Y axis.
	///   - dz: Scale along Z axis.
	/// - Returns: A transform.
	@inlinable public static func scale(
		x: CGFloat,
		y: CGFloat,
		z: CGFloat
	) -> CATransform3D {
		return CATransform3DIdentity.scaled(x: x, y: y, z: z)
	}

}
#endif
