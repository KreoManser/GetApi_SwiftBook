//
//  Fruit.swift
//  GetApi_SwiftBook
//
//  Created by Сергей Бабич on 09.08.2022.
//

import Foundation

struct Fruit: Decodable {
    let genus: String
    let name: String
    let family: String
    let nutritions: Nutritions
}

struct Nutritions: Decodable {
    let carbohydrates: Double
    let protein: Double
    let fat: Double
    let calories: Double
    let sugar: Double
}
