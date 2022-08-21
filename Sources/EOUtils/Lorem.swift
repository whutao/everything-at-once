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
        

import Foundation
import EOSwift


// MARK: Lorem

/// Generator for "Lorem" texts.
public struct Lorem {
    
    private static let allWords: Array<String> = [
        "orci", "risus", "mauris", "vulputate", "dictumst",
        "ultrices", "suscipit", "vel", "quis", "sagittis",
        "nisi", "tincidunt", "hendrerit", "aliquet", "ligula",
        "purus", "integer", "volutpat", "lectus", "molestie",
        "finibus", "sed", "est", "vitae", "egestas", "neque",
        "semper", "phasellus", "vivamus", "elementum",
        "dignissim", "hac", "proin", "nulla", "donec",
        "turpis", "sapien", "dictum", "posuere", "ex", "at",
        "adipiscing", "feugiat", "tempus", "sollicitudin",
        "felis", "duis", "justo", "interdum", "ornare", "habitasse",
        "gravida", "bibendum", "metus", "iaculis", "consequat",
        "primis", "elit", "pharetra", "nisl", "viverra",
        "ullamcorper", "etiam", "platea", "tristique", "cras",
        "lobortis", "eleifend", "mollis", "rutrum", "convallis",
        "nec", "pretium", "varius", "lorem", "in", "vehicula",
        "imperdiet", "fermentum", "tellus", "quam", "libero",
        "ante", "tortor", "porta", "sodales", "amet", "luctus",
        "massa", "nibh", "rhoncus", "non", "malesuada", "porttitor",
        "maximus", "morbi", "vestibulum", "erat", "condimentum",
        "suspendisse", "auctor", "id", "ac", "venenatis", "efficitur",
        "fusce", "blandit", "diam", "enim", "nullam", "accumsan", "odio",
        "lacinia", "magna", "leo", "laoreet", "lacus", "pellentesque",
        "mi", "velit", "euismod", "praesent", "scelerisque", "sit",
        "eget", "dolor", "dapibus", "fames", "faucibus", "nam", "augue",
        "curabitur", "pulvinar", "et", "eu", "cursus", "urna", "sem",
        "a", "maecenas", "consectetur", "ipsum", "quisque", "eros",
        "arcu", "tempor", "aliquam", "facilisis", "nunc", "fringilla",
        "commodo", "facilisi", "dui", "placerat", "mattis",
        "ultricies", "aenean", "ut"
    ]
    
}


// MARK: Instances

extension Lorem {
    
    /// Random sentence of *length* words.
    static func sentence(ofLength length: Int) -> String {
        
        let rawSentance: String = Range(0...length)
            .map { _ in word }
            .joined(separator: " ")
        
        return rawSentance.firstLetterCapitalized + "."
            
    }
    
    /// Random paragraph with *length* sentences.
    static func paragraph(ofLength length: Int) -> String {
        
        return Range(0...length)
            .map { _ in sentence(ofLength: .random(in: 3...16)) }
            .joined(separator: " ")
        
    }
    
    /// Random "Lorem Ipsum" lowercased word.
    static var word: String {
        return allWords.randomElement()!
    }
    
    /// Random "Lorem Ipsum" capitalized word.
    static var capitalizedWord: String {
        return word.firstLetterCapitalized
    }
    
    /// Random fullname consisting of "Lorem Ipsum" words.
    static var fullname: String {
        return capitalizedWord + " " + capitalizedWord
    }
    
    /// Random email consisting of "Lorem Ipsum" words.
    static var email: String {
        return word + word + "@" + word + ".com"
    }
    
    /// Random "Lorem Ipsum" sentence that contains from 3 to 5 words.
    static var shortSentence: String {
        return sentence(ofLength: .random(in: 3...5))
    }
    
    /// Random "Lorem Ipsum" sentence that contains from 6 to 10 words.
    static var sentence: String {
        return sentence(ofLength: .random(in: 6...10))
    }
    
    /// Random "Lorem Ipsum" sentence that contains from 11 to 16 words.
    static var longSentence: String {
        return sentence(ofLength: .random(in: 11...16))
    }
    
    /// Random "Lorem Ipsum" paragraph that contains from 3 to 5 senences.
    static var shortParagraph: String {
        return paragraph(ofLength: .random(in: 3...5))
    }
    
    /// Random "Lorem Ipsum" paragraph that contains from 6 to 10 senences.
    static var paragraph: String {
        return paragraph(ofLength: .random(in: 6...10))
    }
    
    /// Random "Lorem Ipsum" paragraph that contains from 11 to 16 senences.
    static var longParagraph: String {
        return paragraph(ofLength: .random(in: 11...16))
    }
    
}
