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

#if canImport(UIKit)
import UIKit
#endif

// MARK: - Modifiers

#if canImport(UIKit)
extension UIButton {

	// MARK: Common

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setPreferredSymbolConfiguration(
		_ configuration: UIImage.SymbolConfiguration?,
		forImageInState state: UIControl.State
	) -> Self {
		self.setPreferredSymbolConfiguration(configuration, forImageIn: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentEdgeInsets(
		_ contentEdgeInsets: UIEdgeInsets
	) -> Self {
		self.contentEdgeInsets = contentEdgeInsets
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentEdgeLeadingInset(
		_ inset: CGFloat
	) -> Self {
		self.contentEdgeInsets.left = inset
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentEdgeTrailingInset(
		_ inset: CGFloat
	) -> Self {
		self.contentEdgeInsets.right = inset
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentEdgeTopInset(
		_ inset: CGFloat
	) -> Self {
		self.contentEdgeInsets.top = inset
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentEdgeBottomInset(
		_ inset: CGFloat
	) -> Self {
		self.contentEdgeInsets.bottom = inset
		return self
	}

	// MARK: Text related

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTitle(
		_ title: String?,
		forState state: UIControl.State
	) -> Self {
		self.setTitle(title, for: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTitleColor(
		_ color: UIColor?,
		forState state: UIControl.State
	) -> Self {
		self.setTitleColor(color, for: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTitleShadowColor(
		_ color: UIColor?,
		forState state: UIControl.State
	) -> Self {
		self.setTitleShadowColor(color, for: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAttributedTitle(
		_ attributedTitle: NSAttributedString?,
		forState state: UIControl.State
	) -> Self {
		self.setAttributedTitle(attributedTitle, for: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setFont(
		_ font: UIFont?
	) -> Self {
		self.titleLabel?.setFont(font)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTextAlignment(
		_ textAlignment: NSTextAlignment
	) -> Self {
		self.titleLabel?.setTextAlignment(textAlignment)
		return self
	}

	// MARK: Image related

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setImageContentMode(
		_ contentMode: UIView.ContentMode
	) -> Self {
		self.imageView?.setContentMode(contentMode)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setImage(
		_ image: UIImage?,
		forState state: UIControl.State
	) -> Self {
		self.setImage(image, for: state)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setBackgroundImage(
		_ image: UIImage?,
		forState state: UIControl.State
	) -> Self {
		self.setBackgroundImage(image, for: state)
		return self
	}

}
#endif
