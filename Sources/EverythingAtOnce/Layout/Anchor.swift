//
//
//  MIT License
//
//  Copyright (c) 2022-Present SugarKit
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

#if canImport(UIKit)
import UIKit
#endif

// MARK: VerticalAnchor

#if canImport(UIKit)
/// Aliases for anchors of the vertical axis.
public enum _VerticalAnchor: UInt8 {

	/// The top anchor.
	case top

	/// The bottom anchor.
	case bottom

	/// The vertical center anchor.
	case centerY

	/// The first baseline anchor.
	case firstBaseline

	/// The last baseline anchor.
	case lastBaseline

	/// Respective Anchorable keypath.
	internal var keyPath: KeyPath<_Anchorable, NSLayoutYAxisAnchor> {
		switch self {
		case .top:
			return \_Anchorable.topAnchor
		case .bottom:
			return \_Anchorable.bottomAnchor
		case .centerY:
			return \_Anchorable.centerYAnchor
		case .firstBaseline:
			return \_Anchorable.firstBaselineAnchor
		case .lastBaseline:
			return \_Anchorable.lastBaselineAnchor
		}
	}

}
#endif

// MARK: Horizontal anchor

#if canImport(UIKit)
/// Aliases for anchors of the horizontal axis.
public enum _HorizontalAnchor: UInt8 {

	/// The leading anchor.
	case leading

	/// The trailing anchor.
	case trailing

	/// The horizontal center anchor.
	case centerX

	/// Respective Anchorable keypath.
	internal var keyPath: KeyPath<_Anchorable, NSLayoutXAxisAnchor> {
		switch self {
		case .leading:
			return \_Anchorable.leadingAnchor
		case .trailing:
			return \_Anchorable.trailingAnchor
		case .centerX:
			return \_Anchorable.centerXAnchor
		}
	}

}
#endif

// MARK: Dimension anchor

#if canImport(UIKit)
/// Aliases for anchors of the dimensions.
public enum _DimensionAnchor: UInt8 {

	/// The width anchor.
	case width

	/// The height anchor.
	case height

	/// Respective Anchorable keypath.
	internal var keyPath: KeyPath<_Anchorable, NSLayoutDimension> {
		switch self {
		case .width:
			return \_Anchorable.widthAnchor
		case .height:
			return \_Anchorable.heightAnchor
		}
	}

}
#endif
