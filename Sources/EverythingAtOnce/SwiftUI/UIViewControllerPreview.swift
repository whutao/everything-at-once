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

#if canImport(UIKit) && canImport(SwiftUI)
import UIKit
import SwiftUI


/// SwiftUI preview for UIKit view controllers.
public struct UIViewControllerPreview<UIViewControllerBody>: UIViewControllerRepresentable
where UIViewControllerBody: UIViewController {
    
    
    private let viewController: UIViewControllerBody
    
    /// Creates an instance using closure builder for the view controller.
    public init(_ builder: @escaping () -> UIViewControllerBody) {
        viewController = builder()
    }
    
    public func makeUIViewController(context: Context) -> UIViewControllerBody {
        return viewController
    }
    
    public func updateUIViewController(_ uiViewController: UIViewControllerBody, context: Context) {
        
    }
    
}
#endif
