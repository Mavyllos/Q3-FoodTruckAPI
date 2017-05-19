//
//  FoodTruckItem.swift
//  FoodTruckAPI
//
//  Created by Summer Barclay on 5/19/17.
//
//

import Foundation

typealias JSONDictionary = [String: Any]

protocol DictionaryConvertable {
    func toDict() -> JSONDictionary
}

public struct FoodTruckItem {
    
    // ID
    public let docId: String
    
    // Name of Food Truck Buisness
    public let name: String
    
    // Food Type
    public let foodType: String
    
    // Average Cost
    public let avgCost: Float
    
    // Coordinates for map
    public let latitude: Float
    public let longitude: Float
    
    public init(docId: String, name: String, foodType: String, avgCost: Float, latitude: Float, longitude: Float) {
        self.docId = docId
        self.name = name
        self.foodType = foodType
        self.avgCost = avgCost
        self.latitude = latitude
        self.longitude = longitude
    }
}

//conform to equatable

extension FoodTruckItem: Equatable {
    public static func == (lhs: FoodTruckItem, rhs: FoodTruckItem) -> Bool {
        //lhs = left hand side, rhs = right hand side
        return lhs.docId == rhs.docId &&
            lhs.name == rhs.name &&
            lhs.foodType == rhs.foodType &&
            lhs.avgCost == rhs.avgCost &&
            lhs.latitude == rhs.latitude &&
            lhs.longitude == rhs.longitude
        
    }
}

//converting from camelcase to all lowercase
extension FoodTruckItem: DictionaryConvertable {
    func toDict() -> JSONDictionary {
        var result = JSONDictionary()
        result["id"] = self.docId
        result["name"] = self.name
        result["foodtype"] = self.foodType
        result["avgcost"] = self.avgCost
        result["latitude"] = self.latitude
        result["longitude"] = self.longitude
        
        return result
    }
}

//uses the toDict func to map across each element in the array and get back JSONDict for each item
extension Array where Element: DictionaryConvertable {
    func toDict() -> [JSONDictionary] {
        return self.map { $0.toDict() }
    }
}
