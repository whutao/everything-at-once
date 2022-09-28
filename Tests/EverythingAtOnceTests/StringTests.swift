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
@testable import EverythingAtOnce
import XCTest


final class StringTests: XCTestCase {
    
    
    /// Sample string.
    private let citation: String = """
        They were all dead. The final gunshot was an exclamation
        mark to everything that had led to this point. I released
        my finger from the trigger. And then it was all over.
        The storm seemed to lose its frenzy.
        The ragged clouds gave way to the stars above.
    """
    
    
    func testSubstringRanges() throws {
        
        let substrings: Array<String> = ["was", "The", "ad"]
        
        try substrings.forEach { substring in
            
            try citation
                .ranges(of: substring)
                .map { NSString(string: citation).substring(with: $0) }
                .map { $0 as String }
                .forEach { XCTAssertEqual($0, substring) }
            
        }
        
    }
    
    func testSubscripts() throws {
        
        var string: String = citation
        
        let character: Character = "+"
        let i: Int = 10
        XCTAssertNotEqual(string[i], character)
        string[i] = character
        XCTAssertEqual(string[i], character)
        string[i] = "~"
        XCTAssertNotEqual(string[i], character)
        
        let range: Range<Int> = 40..<80
        let substring: String = String(repeating: "O", count: range.indices.count)
        XCTAssertNotEqual(string[range], substring)
        string[range] = substring
        XCTAssertEqual(string[range], substring)
        string[range] = String(repeating: "P", count: range.indices.count)
        XCTAssertNotEqual(string[range], substring)
        
    }
    
    func testSubscriptPerformance() {
        
        var string: String = String(repeating: citation, count: 300)
        
        measure {
            
            let range: Range<Int> = 4000..<8000
            let substring: String = String(repeating: "O", count: range.indices.count)
            string[range] = substring
            
        }
        
    }
    
    func testNSMutableAttributedStringMutationPerformance() throws {
        
        let mutableAttributedString = NSMutableAttributedString(
            string: String(repeating: citation, count: 30)
        )
        .withFont(.systemFont(ofSize: 10))
        .withTextColor(.darkText)
        .withBackgroundColor(.white)
        .withParagraphStyle(.default)
        
        try mutableAttributedString
            .mutableString
            .ranges(of: "was", options: [.caseInsensitive])
            .forEach { range in
                mutableAttributedString
                    .withFont(.systemFont(ofSize: 20), at: range)
                    .withTextColor(.brown, at: range)
                    .withLink(URL(string: "meow")!, at: range)
            }
        
        measure {
         
            mutableAttributedString.enumerateAttributes(
                in: mutableAttributedString.fullRange,
                options: .longestEffectiveRangeNotRequired
            ) { attributes, range, shouldStopFurtherProcessing in
                
                print("\(range): \(attributes.debugDescription)\n")
                
            }
            
        }
        
    }
    
    func testPredicates() {
        
//        let predicate: NSPredicate = .equalPredicate(keyPath: #keyPath(CGSize.width), value: 40)
//
//        print(predicate)
        
    }
    
}
#endif
