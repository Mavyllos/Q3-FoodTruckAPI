//
//  FoodTruckAPI.swift
//  FoodTruckAPI
//
//  Created by Summer Barclay on 5/19/17.
//
//

public protocol FoodTruckAPI {
    
    // Trucks
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
    // Similar to the add but with ? to make the values optional
    func updateTruck(docId: String, name: String?, foodType: String?, avgCost: Float?, latitude: Float?, longitude: Float?, completion: @escaping (FoodTruckItem?, Error?) -> Void)
    
    // Get Count of all Trucks
    func countTrucks(completion: @escaping (Int?, Error?) -> Void)
    
    // Reviews
    // All Reviews for a specfic truck
    func getReviews(truckId: String, completion: @escaping ([ReviewItem]?, Error?) -> Void)
    
    // Specific review by id
    func getReview(docId: String, completion: @escaping (ReviewItem?, Error?) -> Void)
    
    // Add review for a specific truck
    func addReview(truckId: String, reviewTitle: String, reviewText: String, reviewStarRating: Int, completion: @escaping (ReviewItem?, Error?) -> Void)
    
    // Update a specific review
    func updateReview(docId: String, truckId: String?, reviewTitle: String?, reviewText: String?, starRating: Int?, completion: @escaping (ReviewItem?, Error?) -> Void)
    
    // Delete specific review
    func deleteReview(docId: String, completion: @escaping (Error?) -> Void)
    
    // Count of ALL reviews
    func countReviews(completion: @escaping (Int?, Error?) -> Void)
    
    // Count of reviews for a SPECIFIC truck
    func countReviews(truckId: String, completion: @escaping (Int?, Error?) -> Void)
    
    // Average star rating for a specific truck
    func averageRating(truckId: String, completion: @escaping (Int?, Error?) -> Void)
    
}
