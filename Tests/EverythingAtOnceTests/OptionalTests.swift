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

@testable import EverythingAtOnce
import XCTest


final class OptionalTests: XCTestCase {
    
    let someString: String? = "Meow"
    let nilString: String? = nil
    let emptyString: String? = .emptyString
    
    let someArray: Array<String>? = ["Meow"]
    let nilArray: Array<String>? = nil
    let emptyArray: Array<String>? = []
    
    func testNillable() {
        
        XCTAssertFalse(someString.isNil)
        XCTAssertFalse(someString.isNilOrEmpty)
        XCTAssertTrue(someString.isNotNil)
        
        XCTAssertTrue(nilString.isNil)
        XCTAssertTrue(nilString.isNilOrEmpty)
        XCTAssertFalse(nilString.isNotNil)
        
        XCTAssertFalse(emptyString.isNil)
        XCTAssertTrue(emptyString.isNilOrEmpty)
        XCTAssertTrue(emptyString.isNotNil)
        
        XCTAssertFalse(someArray.isNil)
        XCTAssertFalse(someArray.isNilOrEmpty)
        XCTAssertTrue(someArray.isNotNil)
        
        XCTAssertTrue(nilArray.isNil)
        XCTAssertTrue(nilArray.isNilOrEmpty)
        XCTAssertFalse(nilArray.isNotNil)
        
        XCTAssertFalse(emptyArray.isNil)
        XCTAssertTrue(emptyArray.isNilOrEmpty)
        XCTAssertTrue(emptyString.isNotNil)
        
    }
    
    func testOptionalFilter() {
        
        XCTAssertNil(nilArray.filter { $0.count == 1023 })
        
        XCTAssertNil(emptyArray.filter { $0.count == 1023 })
        XCTAssertNotNil(emptyArray.filter { $0.count == 0 })
        
        XCTAssertNil(someArray.filter { $0.count == 1023 })
        XCTAssertNotNil(someArray.filter { $0.count == 1 })
        
    }
    
}
