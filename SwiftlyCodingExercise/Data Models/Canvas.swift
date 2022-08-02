//
//  Canvas.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/30/22.
//

import Foundation

struct Canvas: Decodable {

    let canvasUnit: Int
    let managerSpecials: [Product]
    
    enum CodingKeys: String, CodingKey {
        case canvasUnit
        case managerSpecials
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.canvasUnit = try container.decode(Int.self, forKey: .canvasUnit)
        self.managerSpecials = try container.decode([FailableDecodable<Product>].self, forKey: .managerSpecials).compactMap({$0.base})
      }
}
