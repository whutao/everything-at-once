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


// MARK: All attributes

#if canImport(Foundation)
import Foundation

extension NSAttributedString {
    
    
    /// Dictionary of the attributes applied to the *whole* string.
    public var attributes: Dictionary<NSAttributedString.Key, Any> {
        
        guard 0 < length else {
            return [:]
        }
        
        return attributes(at: 0, effectiveRange: nil)
    
    }
    
}
#endif


// MARK: Add attribute

#if canImport(Foundation)
import Foundation

extension NSAttributedString {
    
    
    /// Returns a new attributed string with applied attribute at the specified range.
    ///
    /// - Parameters:
    ///   - name: Key name.
    ///   - value: Attribute value.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func addAttribute(_ name: NSAttributedString.Key, value: Any?, at range: NSRange? = nil) -> NSMutableAttributedString {
        
        let mutableAttributedString = NSMutableAttributedString(attributedString: self)
        
        guard let value = value else {
            return mutableAttributedString
        }

        mutableAttributedString.addAttribute(name, value: value, range: range ?? fullRange)
        return mutableAttributedString
        
    }
    
}
#endif


// MARK: Add attributes

#if canImport(UIKit)
import UIKit

extension NSAttributedString {
    
    
    /// Returns a new attributed string with modified text font attribute at the specified range.
    ///
    /// - Parameters:
    ///   - uiFont: Text font.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func font(_ uiFont: UIFont, at range: NSRange? = nil) -> NSMutableAttributedString {
        return addAttribute(.font, value: uiFont, at: range)
    }
    
    /// Returns a new attributed string with modified text color attribute at the specified range.
    ///
    /// - Parameters:
    ///   - uiColor: Text color.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func textColor(_ uiColor: UIColor?, at range: NSRange? = nil) -> NSMutableAttributedString {
        return addAttribute(.foregroundColor, value: uiColor, at: range)
    }
    
    /// Returns a new attributed string with modified background color attribute at the specified range.
    ///
    /// - Parameters:
    ///   - uiColor: Background color.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func backgroundColor(_ uiColor: UIColor?, at range: NSRange? = nil) -> NSMutableAttributedString {
        return addAttribute(.backgroundColor, value: uiColor, at: range)
    }
    
    /// Returns a new attributed string with modified paragraph attribute at the specified range.
    ///
    /// - Parameters:
    ///   - style: Paragraph style.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func paragraph(_ style: NSParagraphStyle?, at range: NSRange? = nil) -> NSMutableAttributedString {
        return addAttribute(.paragraphStyle, value: style, at: range)
    }
    
    /// Returns a new attributed string with modified shadow attribute at the specified range.
    ///
    /// - Parameters:
    ///   - nsShadow: Text shadow.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func shadow(_ nsShadow: NSShadow?, at range: NSRange? = nil) -> NSMutableAttributedString {
        return addAttribute(.shadow, value: nsShadow, at: range)
    }
    
    /// Returns a new attributed string with modified shadow attribute at the specified range.
    ///
    /// - Parameters:
    ///   - color: Shadow color. Can be set `nil`.
    ///   - offset: Shadow offset.
    ///   - radius: Shadow radius.
    ///   - range: Text range to apply an attribute. Consideres the whole string if `nil` is provided.
    /// - Returns: A copy of the source string with applied attribute.
    public func shadow(color: UIColor?, offset: CGSize = .zero, radius: CGFloat = .zero, at range: NSRange? = nil) -> NSMutableAttributedString {
        let nsShadow = NSShadow()
        nsShadow.shadowColor = color
        nsShadow.shadowOffset = offset
        nsShadow.shadowBlurRadius = radius
        return shadow(nsShadow, at: range)
    }

}
#endif
