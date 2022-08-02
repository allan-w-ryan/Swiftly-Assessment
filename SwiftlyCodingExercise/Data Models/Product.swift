//
//  Product.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/30/22.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id = UUID()
    
    let imageUrl: String
    let width: Int
    let height: Int
    let displayName: String
    let originalPrice: NSNumber
    let price: NSNumber
    
    enum CodingKeys: String, CodingKey {
        case imageUrl
        case width
        case height
        case displayName = "display_name"
        case originalPrice = "original_price"
        case price
    }
    
    init(imageUrl: String, width: Int, height: Int, displayName:String, originalPrice:NSNumber, price:NSNumber) {
        self.imageUrl = imageUrl
        self.width = width
        self.height = height
        self.displayName = displayName
        self.originalPrice = originalPrice
        self.price = price
    }
    
    init(from decoder: Decoder) throws {

        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let imageUrl = try container.decode(String.self, forKey: .imageUrl)
            let width = try container.decode(Int.self, forKey: .width)
            let height = try container.decode(Int.self, forKey: .height)
            let displayName = try container.decode(String.self, forKey: .displayName)
            let originalPriceString = try container.decode(String.self, forKey: .originalPrice)
            let priceString = try container.decode(String.self, forKey: .price)

            guard let originalPriceNumeric = Double(originalPriceString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CodingKeys.originalPrice], debugDescription: "original_price could not be decoded to an NSNumber"))
            }
            
            guard let priceNumeric = Double(priceString) else {
                throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: [CodingKeys.price], debugDescription: "price could not be decoded to an NSNumber"))
            }

            let originalPrice = NSNumber(value: originalPriceNumeric)
            let price = NSNumber(value: priceNumeric)

            self.init(imageUrl: imageUrl, width: width, height: height, displayName: displayName, originalPrice: originalPrice, price: price)
        } catch {
            throw error
        }
    }

}
