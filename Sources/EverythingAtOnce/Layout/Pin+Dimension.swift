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

// MARK: Dimension anchor to sibling

#if canImport(UIKit)
internal func _pin(
	_ sourceAnchor: _DimensionAnchor,
	to destinationAnchor: _DimensionAnchor,
	of destination: _Anchorable,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription {

	return _pin(
		sourceAnchor.keyPath,
		to: destinationAnchor.keyPath,
		of: destination,
		relation: relation,
		offset: offset,
		multiplier: multiplier,
		priority: priority,
		identifier: identifier
	)

}
#endif

// MARK: Dimension anchor to superview

#if canImport(UIKit)
internal func _pin(
	_ sourceAnchor: _DimensionAnchor,
	toSuperview destinationAnchor: _DimensionAnchor,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription {
	return _pin(
		sourceAnchor.keyPath,
		toSuperview: destinationAnchor.keyPath,
		relation: relation,
		offset: offset,
		multiplier: multiplier,
		priority: priority,
		identifier: identifier
	)
}
#endif

// MARK: Dimension anchor to constant

#if canImport(UIKit)
internal func _pin(
	_ sourceAnchor: _DimensionAnchor,
	to constant: CGFloat,
	relation: NSLayoutConstraint.Relation = .equal,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription {
	return _pin(
		sourceAnchor.keyPath,
		to: constant,
		relation: relation,
		multiplier: multiplier,
		priority: priority,
		identifier: identifier
	)
}
#endif
