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

import Foundation


/// Wrapped unfair lock. Provides an API for working with the C unfair lock.
///
/// - Note: The *os_unfair_lock* mutex is currently the fastest lock available on the iOS.
public final class UnfairLock {
    
    
    /// Wrapper raw pointer to the C lock.
    private var _lock: UnsafeMutablePointer<os_unfair_lock>
    
    /// Creates an instance of the unfair lock. Initializer does not block the current thread.
    public init() {
        _lock = UnsafeMutablePointer<os_unfair_lock>.allocate(capacity: 1)
        _lock.initialize(to: os_unfair_lock())
    }
    
    /// Release the resources.
    deinit {
        _lock.deallocate()
    }
    
    
    /// Executes a closure blocking the current thread and releasing it after the closure.
    public func perform<Value>(_ closure: () throws -> Value) rethrows ->  Value {
        
        defer {
            os_unfair_lock_unlock(_lock)
        }
        
        os_unfair_lock_lock(_lock)
        
        return try closure()
        
    }
    
}
