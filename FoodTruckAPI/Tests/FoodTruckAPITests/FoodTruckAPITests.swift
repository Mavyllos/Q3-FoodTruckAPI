import XCTest
@testable import FoodTruckAPI

class FoodTruckAPITests: XCTestCase {
    
    
    static var allTests : [(String, (FoodTruckAPITests) -> () throws -> Void)] {
        return [
            ("testAddTruck", testAddAndGetTruck),
            ("testUpdateTruck", testUpdateTruck),
            ("testClearAll", testClearAll),
            ("testDeleteTruck", testDeleteTruck),
            ("testCountTrucks", testCountTrucks)
        ]
    }
    
    var trucks: FoodTruck?
    
    override func setUp() {
        trucks = FoodTruck()
        super.setUp()
    }
    
    override func tearDown() {
        guard let trucks = trucks else {
            return
        }
        trucks.clearAll { (err) in
            guard err == nil else {
                return
            }
        }
    }
    
    // Add and Get specific truck
    func testAddAndGetTruck() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
        
        let addExpectation = expectation(description: "Add truck item")
        
        // First add new truck
        trucks.addTruck(name: "testAdd", foodType: "testType", avgCost: 0, latitude: 0, longitude: 0) { (addedTruck, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            
            if let addedTruck = addedTruck {
                trucks.getTruck(docId: addedTruck.docId, completion: { (returnedTruck, err) in
                    
                    // Assert that the added truck equals the returned truck
                    XCTAssertEqual(addedTruck, returnedTruck)
                    addExpectation.fulfill()
                })
            }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err, "addTruck Timeout")
        }
    }
    
    func testUpdateTruck() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
        
        let updateExpectation = expectation(description: "Update truck item")
        
        // First add a new truck
        trucks.addTruck(name: "testUpdate", foodType: "testUpdate", avgCost: 0, latitude: 0, longitude: 0) { (addedTruck, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            
            if let addedTruck = addedTruck {
                
                // Update the added truck
                trucks.updateTruck(docId: addedTruck.docId, name: "UpdatedTruck", foodType: nil, avgCost: nil, latitude: nil, longitude: nil, completion: { (updatedTruck, err) in
                    guard err == nil else {
                        XCTFail()
                        return
                    }
                    if let updatedTruck = updatedTruck {
                        // Fetch the truck from the DB
                        trucks.getTruck(docId: addedTruck.docId, completion: { (fetchedTruck, err) in
                            // Assert that the update truck equals the fetched truck
                            XCTAssertEqual(fetchedTruck, updatedTruck)
                            updateExpectation.fulfill()
                        })
                    }
                })
            }
        }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err, "Update Truck timeout")
        }
    }
    
    // Clear all documents
    func testClearAll() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
        
        let clearExpectation = expectation(description: "Clear all DB documents")
        
        trucks.addTruck(name: "testClearAll", foodType: "testClearAll", avgCost: 0, latitude: 0, longitude: 0) { (addedTruck, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            trucks.clearAll { (err) in
                
            }
            trucks.countTrucks { (count, err) in
                XCTAssertEqual(count, 0)
                
                //Count reviews here
                    
                    clearExpectation.fulfill()
                })
            }
        }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err, "clearAll Timeout")
        }
    }
    
    // Delete truck
    func testDeleteTruck() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
        
        let deleteExpectation = expectation(description: "Delete a specific truck")
        
        // First add a new truck
        trucks.addTruck(name: "testDelete", foodType: "testDelete", avgCost: 0, latitude: 0, longitude: 0) { (addedTruck, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            
            if let addedTruck = addedTruck {
                
                // Second Delete the truck
                    trucks.deleteTruck(docId: addedTruck.docId, completion: { (err) in
                        guard err == nil else {
                            XCTFail()
                            return
                        }
                })
                
                // Count trucks to assert that count == 0
                trucks.countTrucks(completion: { (count, err) in
                    XCTAssertEqual(count, 0)
                    
                    //reviews here later
                        
                        deleteExpectation.fulfill()
                })
            }
        }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err, "Delete truck timeout")
        }
    }
    // Count of all trucks
    func testCountTrucks() {
        guard let trucks = trucks else {
            XCTFail()
            return
        }
    
        let countExpectation = expectation(description: "Test Truck Count")
    
        for _ in 0..<5 {
            trucks.addTruck(name: "testCount", foodType: "testCount", avgCost: 0, latitude: 0, longitude: 0, completion: { (addedTruck, err) in
                guard err == nil else {
                    XCTFail()
                    return
                }
            })
        }
    
        // Count should equal 5
        trucks.countTrucks { (count, err) in
            guard err == nil else {
                XCTFail()
                return
            }
            XCTAssertEqual(count, 5)
            countExpectation.fulfill()
        }
        waitForExpectations(timeout: 5) { (err) in
            XCTAssertNil(err)
        }
    }
}
