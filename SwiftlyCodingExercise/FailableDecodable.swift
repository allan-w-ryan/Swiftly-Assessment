//
//  FailableDecodable.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/31/22.
//

import Foundation

struct FailableDecodable<T : Decodable> : Decodable {

    let base: T?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(T.self)
    }
}
