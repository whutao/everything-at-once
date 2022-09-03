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


extension UIApplication {
    
    
    /// The currently top-most view controller in the view hierarchy of the key window.
    public var topViewController: UIViewController? {
        
        return UIApplication.shared
            .windows
            .filter(\.isKeyWindow)
            .first
            .flatMap(topViewController(forWindow:))
        
    }
    
    /// The currently top-most view controller in the view hierarchy of the specified window.
    public func topViewController(forWindow window: UIWindow) -> UIViewController? {
        return topViewController(base: window.rootViewController)
    }
    
    /// The currently top-most view controller in the view hierarchy starting from the `baseViewController`.
    public func topViewController(base baseViewController: UIViewController?) -> UIViewController? {
        
        // Consider navigation presention.
        if let navigationController = baseViewController as? UINavigationController {
            
            return topViewController(base: navigationController.visibleViewController)
            
        }
        
        // Consider tab presentation.
        if let tabBarController = baseViewController as? UITabBarController {
            
            if let selectedViewController = tabBarController.selectedViewController {
                
                return topViewController(base: selectedViewController)
                
            }
            
        }
        
        // Consider modal presentation.
        if let presentedViewController = baseViewController?.presentedViewController {
            
            return topViewController(base: presentedViewController)
            
        }
        
        return baseViewController
        
    }
    
}
#endif
