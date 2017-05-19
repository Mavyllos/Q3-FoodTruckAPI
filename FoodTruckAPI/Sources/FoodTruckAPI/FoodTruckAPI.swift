public protocol FoodTruckAPI {
    
    // MARK: Trucks
    // Get all Food Trucks
    func getAlllTrucks(completion: @escaping ([FoodTruckItem]?, Error?) -> Void)
}
