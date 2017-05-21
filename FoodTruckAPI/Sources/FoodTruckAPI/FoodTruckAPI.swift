public protocol FoodTruckAPI {
    
    // MARK: Trucks
    // Get all Food Trucks
    func getAllTrucks(completion: @escaping ([FoodTruckItem]?, Error?) -> Void)
    
    // Get One Food Truck
    func getTruck(docId: String, completion: @escaping (FoodTruckItem?, Error?) -> Void)
    
    // Add New Food Truck
    func addTruck(name: String, foodType: String, avgCost: Float, latitude: Float, longitude: Float, completion: @escaping (FoodTruckItem?, Error?) -> Void)
    
    // Clear All Food Trucks
    func clearAll(completion: @escaping (Error?) -> Void)
    
    // Delete All Food Trucks
    func deleteTruck(docId: String, completion: @escaping (Error?) -> Void)
    
    // Update One Food Truck
    func updateTruck(docId: String, name: String?, foodType: String?, avgCost: Float?, latitude: Float?, longitude: Float?, completion: @escaping (FoodTruckItem?, Error?) -> Void)
    
}
