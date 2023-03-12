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

final class CGAffineTransformTests: XCTestCase {

    let identity: CGAffineTransform = .identity

    let rotate1: CGAffineTransform = .rotate(angle: CGFloat.pi)
    let rotate1Inverse: CGAffineTransform = .rotate(angle: -CGFloat.pi)

    let rotate2: CGAffineTransform = .rotate(angle: (0.2) * CGFloat.pi)
    let rotate2Inverse: CGAffineTransform = .rotate(angle: (-0.2) * CGFloat.pi)

    let translate1: CGAffineTransform = .translate(x: 200, y: 10)
    let translate1Inverse: CGAffineTransform = .translate(x: -200, y: -10)

    let translate2: CGAffineTransform = .translate(x: -80, y: 100)
    let translate2Inverse: CGAffineTransform = .translate(x: 80, y: -100)

    let scale1: CGAffineTransform = .scale(x: 4.0, y: 10.0)
    let scale1Inverse: CGAffineTransform = .scale(x: 0.25, y: 0.1)

    let scale2: CGAffineTransform = .scale(x: 0.5, y: 5)
    let scale2Inverse: CGAffineTransform = .scale(x: 2, y: 0.2)

    func testInverses() {

        XCTAssertEqual(rotate1 * rotate1Inverse, identity)
        XCTAssertEqual(rotate1Inverse * rotate1, identity)

        XCTAssertEqual(rotate2 * rotate2Inverse, identity)
        XCTAssertEqual(rotate2Inverse * rotate2, identity)

        XCTAssertEqual(translate1 * translate1Inverse, identity)
        XCTAssertEqual(translate1Inverse * translate1, identity)

        XCTAssertEqual(translate2 * translate2Inverse, identity)
        XCTAssertEqual(translate2Inverse * translate2, identity)

        XCTAssertEqual(scale1 * scale1Inverse, identity)
        XCTAssertEqual(scale1Inverse * scale1, identity)

        XCTAssertEqual(scale2 * scale2Inverse, identity)
        XCTAssertEqual(scale2Inverse * scale2, identity)

    }

    func testHomogeneousCommutativity() {

        XCTAssertEqual(rotate1 * rotate2, rotate2 * rotate1)
        XCTAssertEqual(translate1 * translate2, translate2 * translate1)
        XCTAssertEqual(scale1 * scale2, scale2 * scale1)

    }

    func testNonHomogeneousCommutativity() {

        XCTAssertNotEqual(rotate1 * scale1, scale1 * rotate1)
        XCTAssertNotEqual(rotate1 * translate2, scale1 * translate2)

        XCTAssertNotEqual(rotate1 * scale1 * rotate1Inverse, rotate1Inverse * scale1 * rotate1)

    }

    func testTransformCombination() {

    }

}
