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

// MARK: Modifier

#if canImport(UIKit)
extension UIView {

	/// Declaratively specifies the constraints for this view. Does **not** create a new view.
	///
	/// There can be 2 cases:
	/// 1. The superview is aleady defined. Constraints will be set immediately.
	/// 2. The superview is not defined yet. Constraints will be stored as pending and will be set right after the view is added to some superview.
	/// - Returns: This view.
	@discardableResult public func withConstraints(
		@_ConstraintDescriptionBuilder _ constraints: () -> Array<ConstraintDescription>
	) -> Self {
		if superview == nil {
			constraintDescriptionBag.append(contentsOf: constraints())
		} else {
			activate(constraints())
		}
		return self
	}

}
#endif
