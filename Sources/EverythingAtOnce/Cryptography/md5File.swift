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

#if canImport(Foundation) && canImport(CryptoKit)
import Foundation
import CryptoKit

/// Composed an MD5 file data from target file URL. Useful for creating checksums.
public func md5File(from url: URL, bufferSize: Int = 1024 * 1024) throws -> Data {
	let file = try FileHandle(forReadingFrom: url)
	defer {
		file.closeFile()
	}
	
	var md5 = CryptoKit.Insecure.MD5()
	
	while autoreleasepool(invoking: {
		let data = file.readData(ofLength: bufferSize)
		if data.isNotEmpty {
			md5.update(data: data)
			return true
		} else {
			return false
		}
	}) {
		
	}
	
	return Data(md5.finalize())
}
#endif
