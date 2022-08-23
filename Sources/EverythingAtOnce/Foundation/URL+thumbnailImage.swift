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

#if canImport(UIKit) && canImport(AVFoundation)
import UIKit
import AVFoundation


extension URL {
    
    
    /// Generates a thumbnail image from the asset URL.
    ///
    /// The URL can be either local or remote. Call the method in an async queue if using the remote URL.
    ///
    /// - Parameters:
    ///   - time: Second at which to take the thumbnail.
    /// - Throws: An NSError if an image cannot be extracted from the URL.
    /// - Returns: A thumbnail image.
    public func thumbnail(at time: Float64) throws -> UIImage {
        
        let generator = AVAssetImageGenerator(asset: AVAsset(url: self))
        let time = CMTimeMakeWithSeconds(time, preferredTimescale: 1)
        
        var videoStartTime = CMTimeMake(value: 0, timescale: 0)
        
        let cgImage = try generator.copyCGImage(at: time, actualTime: &videoStartTime)
        
        return UIImage(cgImage: cgImage)
        
    }
    
}
#endif
