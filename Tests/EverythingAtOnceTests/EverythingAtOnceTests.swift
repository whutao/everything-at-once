import XCTest
@testable import EverythingAtOnce


final class EverythingAtOnceTests: XCTestCase {
    
    @Atomic var x: Int = 0
    
    func testExample() throws {
        
        x += 9
        
        XCTAssertEqual(x, 9)
        
    }
    
}
