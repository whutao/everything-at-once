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

#if canImport(Foundation) && canImport(CoreText)
import Foundation
import CoreText

extension CTFrame {

	/// Returns the range of characters originally requested to fill the frame.
	@inlinable public var stringNSRange: NSRange {
		return NSRange(stringRange)
	}

	/// Returns the range of characters that actually fit in the frame.
	@inlinable public var visibleStringNSRange: NSRange {
		return NSRange(visibleStringRange)
	}

	/// Returns the range of characters originally requested to fill the frame.
	///
	/// A CFRange structure containing the backing store range of characters that were originally requested to fill the frame, or, if the function call is not successful, an empty range.
	@inlinable public var stringRange: CFRange {
		return CTFrameGetStringRange(self)
	}

	/// Returns the range of characters that actually fit in the frame.
	///
	/// This function can be used to cascade frames, because it returns the range of characters that can be seen in the frame. The next frame would start where this frame ends.
	@inlinable public var visibleStringRange: CFRange {
		return CTFrameGetVisibleStringRange(self)
	}

}
#endif
