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

// MARK: Horitzontal stack

#if canImport(UIKit)
/// Stack that aranges its subviews along the horizontal axis.
public func HorizontalStack(
	frame: CGRect = .zero,
	spacing: CGFloat = .zero,
	alignment: UIStackView.Alignment = .center,
	distribution: UIStackView.Distribution = .fill,
	@_UIViewBuilder views: () -> Array<UIView>
) -> UIStackView {
	let stack = UIStackView(frame: frame)
	stack.axis = .horizontal
	stack.spacing = spacing
	stack.alignment = alignment
	stack.distribution = distribution
	views().forEach(stack.addArrangedSubview(_:))
	return stack
}
#endif

// MARK: Vertical stack

#if canImport(UIKit)
/// Stack that aranges its subviews along the vertical axis.
public func VerticalStack(
	frame: CGRect = .zero,
	spacing: CGFloat = .zero,
	alignment: UIStackView.Alignment = .center,
	distribution: UIStackView.Distribution = .fill,
	@_UIViewBuilder views: () -> Array<UIView>
) -> UIStackView {
	let stack = UIStackView(frame: frame)
	stack.axis = .vertical
	stack.spacing = spacing
	stack.alignment = alignment
	stack.distribution = distribution
	views().forEach(stack.addArrangedSubview(_:))
	return stack
}
#endif
