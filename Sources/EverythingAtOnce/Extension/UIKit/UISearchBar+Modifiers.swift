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
extension UISearchBar {
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDelegate(
		_ delegate: UISearchBarDelegate?
	) -> Self {
		self.delegate = delegate
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
	@discardableResult public func setEnablesReturnKeyAutomatically(
		_ enablesReturnKeyAutomatically: Bool
	) -> Self {
		self.enablesReturnKeyAutomatically = enablesReturnKeyAutomatically
		return self
	}
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setBarStyle(
		_ barStyle: UIBarStyle
	) -> Self {
		self.barStyle = barStyle
		return self
	}
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSearchBarStyle(
		_ searchBarStyle: UISearchBar.Style
	) -> Self {
		self.searchBarStyle = searchBarStyle
		return self
	}
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setBackgroundImage(
		image: UIImage?,
		for position: UIBarPosition,
		barMetrics: UIBarMetrics
	) -> Self {
		self.setBackgroundImage(image, for: position, barMetrics: barMetrics)
		return self
	}
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSearchTextFieldFont(
		_ font: UIFont
	) -> Self {
		self.searchTextField.font = font
		return self
	}
	
	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSearchTextFieldTextColor(
		_ textColor: UIColor?
	) -> Self {
		self.searchTextField.textColor = textColor
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
	
}
#endif
