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

// MARK: Anchor to sibling

#if canImport(UIKit)
internal func _pin<Anchor, Axis>(
	_ sourceKeyPath: KeyPath<_Anchorable, Anchor>,
	to destinationKeyPath: KeyPath<_Anchorable, Anchor>,
	of destination: _Anchorable,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription where Anchor: NSLayoutAnchor<Axis> {
	return { anchorable in
		let constraint: NSLayoutConstraint
		
		switch relation {
		case .equal:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				equalTo: destination[keyPath: destinationKeyPath],
				constant: offset
			)
		case .lessThanOrEqual:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				lessThanOrEqualTo: destination[keyPath: destinationKeyPath],
				constant: offset
			)
		case .greaterThanOrEqual:
			constraint =  anchorable[keyPath: sourceKeyPath].constraint(
				greaterThanOrEqualTo: destination[keyPath: destinationKeyPath],
				constant: offset
			)
		@unknown default:
			fatalError("Unknown NSLayoutConstraint relation case. Contact the developer ASAP.")
		}
		
		constraint.priority = priority
		constraint.identifier = identifier
		return constraint.withMultiplier(multiplier)
	}
}
#endif

// MARK: Anchor to superview

#if canImport(UIKit)
internal func _pin<Anchor, Axis>(
	_ sourceKeyPath: KeyPath<_Anchorable, Anchor>,
	toSuperview destinationKeyPath: KeyPath<_Anchorable, Anchor>,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription where Anchor: NSLayoutAnchor<Axis> {
	return { anchorable in
		guard let superview = anchorable.superview else {
			fatalError("No superview found.")
		}
		
		let constraint: NSLayoutConstraint
		
		switch relation {
		case .equal:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				equalTo: superview[keyPath: destinationKeyPath],
				constant: offset
			)
		case .lessThanOrEqual:
			constraint =  anchorable[keyPath: sourceKeyPath].constraint(
				lessThanOrEqualTo: superview[keyPath: destinationKeyPath],
				constant: offset
			)
		case .greaterThanOrEqual:
			constraint =  anchorable[keyPath: sourceKeyPath].constraint(
				greaterThanOrEqualTo: superview[keyPath: destinationKeyPath],
				constant: offset
			)
		@unknown default:
			fatalError("Unknown NSLayoutConstraint relation case. Contact the developer ASAP.")
		}
		
		constraint.priority = priority
		constraint.identifier = identifier
		return constraint.withMultiplier(multiplier)
	}
}
#endif

// MARK: Dimension to sibling

#if canImport(UIKit)
internal func _pin<Dimension>(
	_ sourceKeyPath: KeyPath<_Anchorable, Dimension>,
	to destinationKeyPath: KeyPath<_Anchorable, Dimension>,
	of destination: _Anchorable,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription where Dimension: NSLayoutDimension {
	return { anchorable in
		let constraint: NSLayoutConstraint
		
		switch relation {
		case .equal:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				equalTo: destination[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		case .lessThanOrEqual:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				lessThanOrEqualTo: destination[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		case .greaterThanOrEqual:
			constraint = anchorable[keyPath: sourceKeyPath].constraint(
				greaterThanOrEqualTo: destination[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		@unknown default:
			fatalError("Unknown NSLayoutConstraint relation case. Contact the developer ASAP.")
		}
		
		constraint.identifier = identifier
		constraint.priority = priority
		return constraint
	}
}
#endif

// MARK: Dimension to superview

#if canImport(UIKit)
internal func _pin<Dimension>(
	_ originKeyPath: KeyPath<_Anchorable, Dimension>,
	toSuperview destinationKeyPath: KeyPath<_Anchorable, Dimension>,
	relation: NSLayoutConstraint.Relation = .equal,
	offset: CGFloat = 0.0,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription where Dimension: NSLayoutDimension {
	return { anchorable in
		guard let superview = anchorable.superview else {
			fatalError("No superview found.")
		}
		
		let constraint: NSLayoutConstraint
		
		switch relation {
		case .equal:
			constraint = anchorable[keyPath: originKeyPath].constraint(
				equalTo: superview[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		case .lessThanOrEqual:
			constraint = anchorable[keyPath: originKeyPath].constraint(
				lessThanOrEqualTo: superview[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		case .greaterThanOrEqual:
			constraint = anchorable[keyPath: originKeyPath].constraint(
				greaterThanOrEqualTo: superview[keyPath: destinationKeyPath],
				multiplier: multiplier,
				constant: offset
			)
		@unknown default:
			fatalError("Unknown NSLayoutConstraint relation case. Contact the developer ASAP.")
		}
		
		constraint.identifier = identifier
		constraint.priority = priority
		return constraint
	}
}
#endif

// MARK: Dimension to constant

#if canImport(UIKit)
internal func _pin<Dimension>(
	_ keyPath: KeyPath<_Anchorable, Dimension>,
	to constant: CGFloat,
	relation: NSLayoutConstraint.Relation = .equal,
	multiplier: CGFloat = 1.0,
	priority: UILayoutPriority = .required,
	identifier: String? = nil
) -> ConstraintDescription where Dimension: NSLayoutDimension {
	return { anchorable in
		let constraint = anchorable[keyPath: keyPath].constraint(
			equalToConstant: (constant * multiplier)
		)
		constraint.identifier = identifier
		constraint.priority = priority
		return constraint
	}
}
#endif
