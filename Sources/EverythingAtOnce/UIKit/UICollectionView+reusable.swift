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


// MARK: Register

#if canImport(UIKit)
extension UICollectionView {
	
	/// Registers a class for use in creating new collection view cells.
	/// - Parameter cell: Cell class.
	public func register<T: UICollectionViewCell>(cellClass cell: T.Type) {
		register(
			T.self,
			forCellWithReuseIdentifier: String(describing: T.self)
		)
	}
	
	/// Registers a class for use in creating new collection header views.
	/// - Parameter headerClass: Header class.
	public func register<T: UICollectionReusableView>(headerClass: T.Type) {
		register(
			T.self,
			forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: String(describing: T.self)
		)
	}
	
	/// Registers a class for use in creating new collection footer views.
	/// - Parameter footerClass: Footer class.
	public func register<T: UICollectionReusableView>(footerClass: T.Type) {
		register(
			T.self,
			forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
			withReuseIdentifier: String(describing: T.self)
		)
	}
	
}
#endif


// MARK: Dequeue

#if canImport(UIKit)
extension UICollectionView {
	
	/// Returns a reusable table-view cell object for the specified class and adds it to the table.
	/// It is assumed that the cell has been registred before. Otherwise, a fatal error will be raised.
	///
	/// ```
	/// let indexPath = IndexPath(row: 1, section: 1)
	/// let cell = collectionView.dequeue(CustomCellClass.self, for: indexPath)
	/// ```
	///
	/// - Parameters:
	///   - cell: Cell class to dequeue. Uses the class name as a reuse identifier.
	///   - indexPath: The index path specifying the location of the cell.
	/// - Returns: A cell object with identifier matching the cell class name.
	public func dequeue<T: UICollectionViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
		return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
	}
	
	/// Returns a reusable table-view cell object for the specified class and adds it to the table.
	/// It is assumed that the cell has been registred before. Otherwise, a fatal error will be raised.
	///
	/// ```
	/// let indexPath = IndexPath(item: 1, section: 1)
	/// let cell: CustomCellClass = collectionView.dequeue(for: indexPath)
	/// ```
	///
	/// - Parameters:
	///   - indexPath: The index path specifying the location of the cell.
	/// - Returns: A cell object with identifier matching the cell class name.
	public func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
		return dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
	}
	
}
#endif
