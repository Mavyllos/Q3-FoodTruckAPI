import XCTest
@testable import FoodTruckAPI

class FoodTruckAPITests: XCTestCase {

    static var allTests : [(String, (FoodTruckAPITests) -> () throws -> Void)] {
        return [
        ("testAddTruck", testAddAndGetTruck),
        ]
    }
    
    var trucks: FoodTruck?
    
    override func setUp() {
        trucks = FoodTruck()
        super.setUp()
    }
    
    // Add and Get specific truck
    
    func testAddAndGetTruck() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
        // set an expectation
        let addExpectation = expectation(description: "Add Truck Item")
        
        // First add new truck
        trucks.addTruck(name: "testAdd", foodType: "testType", avgCost: 0, latitude: 0, longitude: 0) { (addedTruck, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            
            if let addedTruck = addedTruck {
                trucks.getTruck(docId: addedTruck.docId) { (returnedTruck, err) in
                    // Assert that the added truck equals the returned truck
                    XCTAssertEqual(addedTruck, returnedTruck)
                    
                    // fulfill the expectation
                    addExpectation.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err, "addTruck timeout")
        }
    }
}
