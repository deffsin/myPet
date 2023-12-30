//
//  AnimalModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 30.12.2023.
//

import Foundation

struct AnimalModel: Codable {
    let animalBreed: String
    let animalDescription: String?
    let animalType: String
    let animalPrice: Int
    let animalLocation: String?
    let dataCreated: Date?
    let owner: UserModel
}
