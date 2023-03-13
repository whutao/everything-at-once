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
extension UICollectionView {

	// MARK: Register

	/// Registers a class for use in creating new collection view cells.
	/// - Parameter cell: Cell class.
	@discardableResult public func setRegistered<T: UICollectionViewCell>(
		cellClass cell: T.Type
	) -> Self {
		register(cellClass: cell.self)
		return self
	}

	/// Registers a class for use in creating new collection header views.
	/// - Parameter headerClass: Header class.
	@discardableResult public func setRegistered<T: UICollectionReusableView>(
		headerClass: T.Type
	) -> Self {
		register(headerClass: headerClass.self)
		return self
	}

	/// Registers a class for use in creating new collection footer views.
	/// - Parameter footerClass: Footer class.
	@discardableResult public func setRegistered<T: UICollectionReusableView>(
		footerClass: T.Type
	) -> Self {
		register(footerClass: footerClass.self)
		return self
	}

	// MARK: Delegate and data source

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDataSource(
		_ dataSource: UICollectionViewDataSource?
	) -> Self {
		self.dataSource = dataSource
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDelegate(
		_ delegate: UICollectionViewDelegate?
	) -> Self {
		self.delegate = delegate
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDropDelegate(
		_ dropDelegate: UICollectionViewDropDelegate?
	) -> Self {
		self.dropDelegate = dropDelegate
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDragDelegate(
		_ dragDelegate: UICollectionViewDragDelegate?
	) -> Self {
		self.dragDelegate = dragDelegate
		return self
	}

	// MARK: Setter methods

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setShowsHorizontalScrollIndicator(
		_ showsHorizontalScrollIndicator: Bool
	) -> Self {
		self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDecelerationRate(
		_ decelerationRate: UICollectionView.DecelerationRate
	) -> Self {
		self.decelerationRate = decelerationRate
		return self
	}

}
#endif
