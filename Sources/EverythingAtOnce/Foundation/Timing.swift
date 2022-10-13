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

#if canImport(Foundation)
import Foundation
#endif


#if canImport(Foundation)

/// Performs a block of code each `seconds` interval.
@discardableResult public func every(
    _ seconds: TimeInterval,
    _ block: (() -> Void)?
) -> Timer {
    
    return .scheduledTimer(
        withTimeInterval: seconds,
        repeats: true
    ) { _ in
        block?()
    }
    
}


/// Performs a block of code each `seconds` interval.
@discardableResult public func every(
    _ seconds: TimeInterval,
    _ block: ((Timer) -> Void)?
) -> Timer {
    
    return .scheduledTimer(
        withTimeInterval: seconds,
        repeats: true
    ) { timer in
        block?(timer)
    }
    
}

/// Performs a block of code after `seconds` interval.
@discardableResult public func after(
    _ seconds: TimeInterval,
    _ block: (() -> Void)?
) -> Timer {
    
    return .scheduledTimer(
        withTimeInterval: seconds,
        repeats: false
    ) { timer in
        block?()
        timer.invalidate()
    }
    
}


/// Performs a block of code after `seconds` interval.
@discardableResult public func after(
    _ seconds: TimeInterval,
    _ block: ((Timer) -> Void)?
) -> Timer {
    
    return .scheduledTimer(
        withTimeInterval: seconds,
        repeats: false
    ) { timer in
        block?(timer)
        timer.invalidate()
    }
    
}

#endif
