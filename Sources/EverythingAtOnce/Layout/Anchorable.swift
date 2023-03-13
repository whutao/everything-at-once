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

// MARK: Protocol

#if canImport(UIKit)
/// Type that has pinning anchors and can be an autolayout subject.
public protocol _Anchorable {
	
	var superview: UIView? { get }
	
	var leadingAnchor: NSLayoutXAxisAnchor { get }
	
	var trailingAnchor: NSLayoutXAxisAnchor { get }
	
	var leftAnchor: NSLayoutXAxisAnchor { get }
	
	var rightAnchor: NSLayoutXAxisAnchor { get }
	
	var topAnchor: NSLayoutYAxisAnchor { get }
	
	var bottomAnchor: NSLayoutYAxisAnchor { get }
	
	var widthAnchor: NSLayoutDimension { get }
	
	var heightAnchor: NSLayoutDimension { get }
	
	var centerXAnchor: NSLayoutXAxisAnchor { get }
	
	var centerYAnchor: NSLayoutYAxisAnchor { get }
	
	var firstBaselineAnchor: NSLayoutYAxisAnchor { get }
	
	var lastBaselineAnchor: NSLayoutYAxisAnchor { get }
	
	@discardableResult func prepareForAutoLayout() -> Self
	
}
#endif

// MARK: UIView + Anchorable

#if canImport(UIKit)
extension UIView: _Anchorable {
	
	@discardableResult public func prepareForAutoLayout() -> Self {
		translatesAutoresizingMaskIntoConstraints = false
		return self
	}
	
}
#endif

// MARK: UILayoutGuide + Anchorable

#if canImport(UIKit)
extension UILayoutGuide: _Anchorable {
	
	public var superview: UIView? {
		fatalError("Superview of a layout guide is not defined.")
	}
	
	public var firstBaselineAnchor: NSLayoutYAxisAnchor {
		return topAnchor
	}
	
	public var lastBaselineAnchor: NSLayoutYAxisAnchor {
		return bottomAnchor
	}
	
	@discardableResult public func prepareForAutoLayout() -> Self {
		return self
	}
	
}
#endif
