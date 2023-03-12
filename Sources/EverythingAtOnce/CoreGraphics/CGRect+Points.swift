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

extension CGRect {

	/// Center of the rectangle.
	public var center: CGPoint {
		return CGPoint(x: midX, y: midY)
	}

	/// Top left corner of the rectangle.
	public var minXminY: CGPoint {
		return origin
	}

	/// Bottom left corner of the rectangle.
	public var minXmaxY: CGPoint {
		return CGPoint(x: minX, y: maxY)
	}

	/// Top right corner of the rectangle.
	public var maxXminY: CGPoint {
		return CGPoint(x: maxX, y: minY)
	}

	/// Bottom right corner of the rectangle.
	public var maxXmaxY: CGPoint {
		return CGPoint(x: maxX, y: maxY)
	}

	/// Center of the top side of the rectangle.
	public var midXminY: CGPoint {
		return CGPoint(x: midX, y: minY)
	}

	/// Center of the bottom side of the rectangle.
	public var midXmaxY: CGPoint {
		return CGPoint(x: midX, y: maxY)
	}

	/// Center of the right side of the rectangle.
	public var maxXmidY: CGPoint {
		return CGPoint(x: maxX, y: midY)
	}

	/// Center of the left side of the rectangle.
	public var minXmidY: CGPoint {
		return CGPoint(x: minX, y: midY)
	}

}
#endif
