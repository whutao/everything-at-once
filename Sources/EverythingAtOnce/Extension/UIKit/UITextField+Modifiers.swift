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
extension UITextField {

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDelegate(
		_ delegate: UITextFieldDelegate
	) -> Self {
		self.delegate = delegate
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setMinimumFontSize(
		_ minimumFontSize: CGFloat
	) -> Self {
		self.minimumFontSize = minimumFontSize
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAdjustsFontSizeToFitWidth(
		_ adjustsFontSizeToFitWidth: Bool
	) -> Self {
		self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setKeyboardAppearance(
		_ keyboardAppearance: UIKeyboardAppearance
	) -> Self {
		self.keyboardAppearance = keyboardAppearance
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setKeyboardType(
		_ keyboardType: UIKeyboardType
	) -> Self {
		self.keyboardType = keyboardType
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAttributedPlaceholder(
		_ attributedPlaceholder: NSAttributedString?
	) -> Self {
		self.attributedPlaceholder = attributedPlaceholder
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setPlaceholder(
		_ placeholder: String?
	) -> Self {
		self.placeholder = placeholder
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTextColor(
		_ textColor: UIColor?
	) -> Self {
		self.textColor = textColor
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setFont(
		_ font: UIFont?
	) -> Self {
		self.font = font
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setText(
		_ text: String?
	) -> Self {
		self.text = text
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAttributedText(
		_ attributedText: NSAttributedString?
	) -> Self {
		self.attributedText = attributedText
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setTextAlignment(
		_ textAlignment: NSTextAlignment
	) -> Self {
		self.textAlignment = textAlignment
		return self
	}

}
#endif
