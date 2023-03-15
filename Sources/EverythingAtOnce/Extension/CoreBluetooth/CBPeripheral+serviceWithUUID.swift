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

#if canImport(CoreBluetooth)
import CoreBluetooth
#endif

#if canImport(CoreBluetooth)
extension CBPeripheral {

	/// Returns a service with specified CBUUID if present.
	public func service(withUUID uuid: CBUUID) -> CBService? {
		return services?.first(where: \.uuid == uuid)
	}

	/// Returns existing services with specified CBUUID if present and a list of CBUUIDs of missing services.
	public func services(
		withUUIDs servicesUUIDs: [CBUUID]
	) -> (foundServices: [CBService], missingServicesUUIDs: [CBUUID]) {
		guard
			let currentServices = self.services,
			currentServices.isNotEmpty
		else {
			return (foundServices: [], missingServicesUUIDs: servicesUUIDs)
		}

		let currentServicesUUIDs = currentServices.map(\.uuid)

		let currentServicesUUIDsSet = Set(currentServicesUUIDs)
		let requestedServicesUUIDsSet = Set(servicesUUIDs)

		let foundServicesUUIDsSet = requestedServicesUUIDsSet.intersection(currentServicesUUIDsSet)
		let missingServicesUUIDsSet = requestedServicesUUIDsSet.subtracting(currentServicesUUIDsSet)

		let foundServices = currentServices.filter({ foundServicesUUIDsSet.contains($0.uuid) })
		let missingServicesUUIDs = Array(missingServicesUUIDsSet)

		return (foundServices, missingServicesUUIDs)
	}

}
#endif
