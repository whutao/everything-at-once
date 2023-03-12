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

#if canImport(Combine)
import Combine

extension Publishers {

	/// A publisher created by applying the zip function to an arbitrary number of upstream publishers. Converts the result to an array of the results of upstream publishers.
	public struct ZipMany<Element, E: Error>: Publisher {

		/// Output type.
		public typealias Output = [Element]

		/// Error type.
		public typealias Failure = E

		/// Wrapped upstream publishers.
		private let upstreams: [AnyPublisher<Element, E>]

		/// Creates an instance of `ZipMany` publisher.
		public init(_ upstreams: [AnyPublisher<Element, E>]) {
			self.upstreams = upstreams
		}

		public func receive<S: Subscriber>(subscriber: S)
		where Self.Failure == S.Failure, Self.Output == S.Input {
			let initial = Just<[Element]>([])
				.setFailureType(to: E.self)
				.eraseToAnyPublisher()

			let zipped = upstreams.reduce(into: initial) { result, upstream in
				result = result.zip(upstream) { elements, element in
					elements + [element]
				}
				.eraseToAnyPublisher()
			}

			zipped.subscribe(subscriber)
		}

	}

}
#endif
