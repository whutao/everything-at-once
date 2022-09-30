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
extension UITableView {
    
    
    /// Registers a class for use in creating new table cells.
    /// Uses cell class name as a reuse identifier.
    ///
    /// - Parameter cell: Cell class.
    public func register<C: UITableViewCell>(cellClass cell: C.Type) {
        register(C.self, forCellReuseIdentifier: String(describing: C.self))
    }
    
    /// Registers a nib object for a cell class for use in creating new table cells.
    /// Is is expected thatUses cell class name as a reuse identifier.
    ///
    /// - Parameter cell: Cell class.
    public func register<C: UITableViewCell>(cellFromNib cell: C.Type) {
        register(
            UINib(nibName: String(describing: C.self), bundle: nil),
            forCellReuseIdentifier: String(describing: C.self)
        )
    }
    
    /// Registers a class for use in creating new table header or footer views.
    /// Uses component class name as a reuse identifier.
    ///
    /// - Parameter headerFooter: Header or footer class.
    public func register<HF: UITableViewHeaderFooterView>(headerFooter: HF.Type) {
        register(HF.self, forHeaderFooterViewReuseIdentifier: String(describing: HF.self))
    }
    
    /// Registers a nib object for a header or footer class for use in creating new table header or footer views.
    /// - Parameter headerFooterFromNib: Header or footer class.
    public func register<HF: UITableViewHeaderFooterView>(headerFooterFromNib: HF.Type) {
        register(
            UINib(nibName: String(describing: HF.self), bundle: nil),
            forHeaderFooterViewReuseIdentifier: String(describing: HF.self)
        )
    }
    
}
#endif


// MARK: Dequeue

#if canImport(UIKit)
extension UITableView {
    
    
    /// Returns a reusable table-view cell object for the specified class and adds it to the table.
    /// It is assumed that the cell has been registred before. Otherwise, a fatal error will be raised.
    ///
    /// ```
    /// let indexPath = IndexPath(row: 1, section: 1)
    /// let cell = tableView.dequeue(CustomCellClass.self, for: indexPath)
    /// ```
    ///
    /// - Parameters:
    ///   - cell: Cell class to dequeue. Uses the class name as a reuse identifier.
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A cell object with identifier matching the cell class name.
    public func dequeue<C: UITableViewCell>(_ cell: C.Type, for indexPath: IndexPath) -> C {
        
        let reusableCell: UITableViewCell = dequeueReusableCell(
            withIdentifier: String(describing: C.self),
            for: indexPath
        )
        
        guard let cell = reusableCell as? C else {
            fatalError("Cell \(C.self) has not been registred.")
        }
        
        return cell
        
    }
    
    /// Returns a reusable table-view cell object for the specified class and adds it to the table.
    /// It is assumed that the cell has been registred before. Otherwise, a fatal error will be raised.
    ///
    /// ```
    /// let indexPath = IndexPath(row: 1, section: 1)
    /// let cell: CustomCellClass = tableView.dequeue(for: indexPath)
    /// ```
    ///
    /// - Parameters:
    ///   - indexPath: The index path specifying the location of the cell.
    /// - Returns: A cell object with identifier matching the cell class name.
    public func dequeue<C: UITableViewCell>(for indexPath: IndexPath) -> C {
        return dequeue(C.self, for: indexPath)
    }
    
    /// Returns a reusable header or footer view after locating it by its identifier.
    public func dequeue<HF: UITableViewHeaderFooterView>(_ headerFooter: HF.Type) -> HF {
        
        let component: UITableViewHeaderFooterView? = dequeueReusableHeaderFooterView(
            withIdentifier: String(describing: HF.self)
        )
        
        guard let component = component as? HF else {
            fatalError("HeaderFooter \(HF.self) has not been registred.")
        }
        
        return component
        
    }
    
}
#endif
