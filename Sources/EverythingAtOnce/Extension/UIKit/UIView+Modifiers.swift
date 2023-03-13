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
extension UIView {

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTintColor(
		_ color: UIColor?
	) -> Self {
		self.tintColor = color
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentMode(
		_ contentMode: UIView.ContentMode
	) -> Self {
		self.contentMode = contentMode
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTag(
		_ tag: Int
	) -> Self {
		self.tag = tag
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentVerticalCompressionResistancePriority(
		_ priority: UILayoutPriority
	) -> Self {
		self.setContentCompressionResistancePriority(priority, for: .vertical)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentHorizontalCompressionResistancePriority(
		_ priority: UILayoutPriority
	) -> Self {
		self.setContentCompressionResistancePriority(priority, for: .horizontal)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentVerticalHuggingPriority(
		_ priority: UILayoutPriority
	) -> Self {
		self.setContentHuggingPriority(priority, for: .vertical)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setContentHorizontalHuggingPriority(
		_ priority: UILayoutPriority
	) -> Self {
		self.setContentHuggingPriority(priority, for: .horizontal)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setUserInteractionEnabled(
		_ isUserInteractionEnabled: Bool
	) -> Self {
		self.isUserInteractionEnabled = isUserInteractionEnabled
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTransform(
		_ transform: CGAffineTransform
	) -> Self {
		self.transform = transform
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTransform3D(
		_ transform: CATransform3D
	) -> Self {
		self.transform3D = transform
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAutoresizingMask(
		_ autoresizingMask: UIView.AutoresizingMask
	) -> Self {
		self.autoresizingMask = autoresizingMask
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTranslatesAutoresizingMaskIntoConstraints(
		_ value: Bool
	) -> Self {
		self.translatesAutoresizingMaskIntoConstraints = value
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setFrame(
		_ frame: CGRect
	) -> Self {
		self.frame = frame
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setOrigin(
		_ origin: CGPoint
	) -> Self {
		self.frame.origin = origin
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSize(
		_ size: CGSize
	) -> Self {
		self.frame.size = size
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setHeight(
		_ height: CGFloat
	) -> Self {
		self.frame.size.height = height
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setWidth(
		_ width: CGFloat
	) -> Self {
		self.frame.size.width = width
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerCornerRadius(
		_ cornerRadius: CGFloat
	) -> Self {
		self.layer.cornerRadius = cornerRadius
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerShadowRadius(
		_ shadowRadius: CGFloat
	) -> Self {
		self.layer.shadowRadius = shadowRadius
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerShadowColor(
		_ shadowColor: UIColor?
	) -> Self {
		self.layer.shadowColor = shadowColor?.cgColor
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerShadowOpacity(
		_ shadowOpacity: Float
	) -> Self {
		self.layer.shadowOpacity = shadowOpacity
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerShadowOffset(
		_ shadowOffset: CGSize
	) -> Self {
		self.layer.shadowOffset = shadowOffset
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerShadowPath(
		_ shadowPath: UIBezierPath?
	) -> Self {
		self.layer.shadowPath = shadowPath?.cgPath
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerBorderWidth(
		_ borderWidth: CGFloat
	) -> Self {
		self.layer.borderWidth = borderWidth
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerBorderColor(
		_ color: UIColor?
	) -> Self {
		self.layer.borderColor = color?.cgColor
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerMasksToBounds(
		_ masksToBounds: Bool
	) -> Self {
		self.layer.masksToBounds = masksToBounds
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setLayerMaskedCorners(
		_ maskedCorners: CACornerMask
	) -> Self {
		self.layer.maskedCorners = maskedCorners
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setBackgroundColor(
		_ backgroundColor: UIColor?
	) -> Self {
		self.backgroundColor = backgroundColor
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAlpha(
		_ alpha: CGFloat
	) -> Self {
		self.alpha = alpha
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setHidden(
		_ isHidden: Bool
	) -> Self {
		self.isHidden = isHidden
		return self
	}

}
#endif
