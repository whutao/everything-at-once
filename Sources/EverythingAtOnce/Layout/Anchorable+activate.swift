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

// MARK: Activate

#if canImport(UIKit)
public extension _Anchorable {
	
	/// Activates provided constraint descriptions for this anchorable. Prepares it for autolayout.
	@discardableResult func activate(
		@_ConstraintDescriptionBuilder _ descriptions: () -> Array<ConstraintDescription>
	) -> [NSLayoutConstraint] {
		prepareForAutoLayout()
		let constraints = descriptions().map({ description in description(self) })
		NSLayoutConstraint.activate(constraints)
		return constraints
	}
	
	/// Activates provided constraint descriptions for this anchorable. Prepares it for autolayout.
	@discardableResult func activate(
		_ descriptions: [ConstraintDescription]
	) -> [NSLayoutConstraint] {
		prepareForAutoLayout()
		let constraints = descriptions.map({ description in description(self) })
		NSLayoutConstraint.activate(constraints)
		return constraints
	}
	
	/// Activates provided constraint descriptions for this anchorable. Prepares it for autolayout.
	@discardableResult func activate(
		_ descriptions: ConstraintDescription...
	) -> [NSLayoutConstraint] {
		prepareForAutoLayout()
		let constraints = descriptions.map({ description in description(self) })
		NSLayoutConstraint.activate(constraints)
		return constraints
	}
	
}
#endif
