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
extension UITableView {

	// MARK: Register

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setRegistered<C: UITableViewCell>(
		cellClass cell: C.Type
	) -> Self {
		register(cellClass: C.self)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setRegistered<C: UITableViewCell>(
		cellFromNib cell: C.Type
	) -> Self {
		register(cellFromNib: C.self)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setRegistered<HF: UITableViewHeaderFooterView>(
		headerFooter: HF.Type
	) -> Self {
		register(headerFooter: headerFooter.self)
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setRegistered<HF: UITableViewHeaderFooterView>(
		headerFooterFromNib: HF.Type
	) -> Self {
		register(headerFooterFromNib: headerFooterFromNib.self)
		return self
	}

	// MARK: Delegate and data source

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDataSource(
		_ dataSource: UITableViewDataSource?
	) -> Self {
		self.dataSource = dataSource
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDelegate(
		_ delegate: UITableViewDelegate?
	) -> Self {
		self.delegate = delegate
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDropDelegate(
		_ dropDelegate: UITableViewDropDelegate?
	) -> Self {
		self.dropDelegate = dropDelegate
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setDragDelegate(
		_ dragDelegate: UITableViewDragDelegate?
	) -> Self {
		self.dragDelegate = dragDelegate
		return self
	}

	// MARK: Heights

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setRowHeight(
		_ rowHeight: CGFloat
	) -> Self {
		self.rowHeight = rowHeight
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setEstimatedRowHeight(
		_ estimatedRowHeight: CGFloat
	) -> Self {
		self.estimatedRowHeight = estimatedRowHeight
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSectionFooterHeight(
		_ sectionFooterHeight: CGFloat
	) -> Self {
		self.sectionFooterHeight = sectionFooterHeight
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSectionHeaderHeight(
		_ sectionHeaderHeight: CGFloat
	) -> Self {
		self.sectionHeaderHeight = sectionHeaderHeight
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setEstimatedSectionHeaderHeight(
		_ estimatedSectionHeaderHeight: CGFloat
	) -> Self {
		self.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setEstimatedSectionFooterHeight(
		_ estimatedSectionFooterHeight: CGFloat
	) -> Self {
		self.estimatedSectionFooterHeight = estimatedSectionFooterHeight
		return self
	}

	// MARK: Other

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setSeparatorStyle(
		_ separatorStyle: UITableViewCell.SeparatorStyle
	) -> Self {
		self.separatorStyle = separatorStyle
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAllowsSelection(
		_ allowsSelection: Bool
	) -> Self {
		self.allowsSelection = allowsSelection
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAllowsMultipleSelection(
		_ allowsMultipleSelection: Bool
	) -> Self {
		self.allowsMultipleSelection = allowsMultipleSelection
		return self
	}

	/// Declaratively sets the propery of a view. Does **not** create a new view.
	/// - Returns: This view with modified property.
	@discardableResult public func setAutomaticallyAdjustsScrollIndicatorInsets(
		_ automaticallyAdjustsScrollIndicatorInsets: Bool
	) -> Self {
		self.automaticallyAdjustsScrollIndicatorInsets = automaticallyAdjustsScrollIndicatorInsets
		return self
	}

}
#endif
