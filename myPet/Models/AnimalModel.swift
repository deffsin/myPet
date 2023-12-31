//
//  AnimalModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 30.12.2023.
//

import Foundation

struct AnimalModel: Codable {
    let ownerId: String
    let ownerFullname: String?
    let ownerPhoneNumber: String?
    let animalDocId: String?
    let animalBreed: String?
    let animalDescription: String?
    let animalType: String?
    let animalPrice: String?
    let animalLocation: String?
    let dataCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.ownerId = auth.uid
        self.ownerFullname = auth.name
        self.ownerPhoneNumber = ""
        self.animalDocId = ""
        self.animalBreed = ""
        self.animalDescription = ""
        self.animalType = ""
        self.animalPrice = ""
        self.animalLocation = ""
        self.dataCreated = Date()
    }
    
    init(
        ownerId: String,
        ownerFullname: String? = nil,
        ownerPhoneNumber: String? = nil,
        animalDocId: String? = nil,
        animalBreed: String? = nil,
        animalDescription: String? = nil,
        animalType: String? = nil,
        animalPrice: String? = nil,
        animalLocation: String? = nil,
        dataCreated: Date? = nil
    ) {
        self.ownerId = ownerId
        self.ownerFullname = ownerFullname
        self.ownerPhoneNumber = ownerPhoneNumber
        self.animalDocId = animalDocId
        self.animalBreed = animalBreed
        self.animalDescription = animalDescription
        self.animalType = animalType
        self.animalPrice = animalPrice
        self.animalLocation = animalLocation
        self.dataCreated = dataCreated
    }
    
    enum CodingKeys: String, CodingKey {
        case ownerId = "owner_id"
        case ownerFullname = "owner_fullname"
        case ownerPhoneNumber = "owner_phonenumber"
        case animalDocId = "animal_doc_id"
        case animalBreed = "animal_breed"
        case animalDescription = "animal_description"
        case animalType = "animal_type"
        case animalPrice = "price"
        case animalLocation = "animal_location"
        case dataCreated = "data_created"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.ownerId = try container.decode(String.self, forKey: .ownerId)
        self.ownerFullname = try container.decodeIfPresent(String.self, forKey: .ownerFullname)
        self.ownerPhoneNumber = try container.decodeIfPresent(String.self, forKey: .ownerPhoneNumber)
        self.animalDocId = try container.decodeIfPresent(String.self, forKey: .animalDocId)
        self.animalBreed = try container.decodeIfPresent(String.self, forKey: .animalBreed)
        self.animalDescription = try container.decodeIfPresent(String.self, forKey: .animalDescription)
        self.animalType = try container.decodeIfPresent(String.self, forKey: .animalType)
        self.animalPrice = try container.decodeIfPresent(String.self, forKey: .animalPrice)
        self.animalLocation = try container.decodeIfPresent(String.self, forKey: .animalLocation)
        self.dataCreated = try container.decodeIfPresent(Date.self, forKey: .dataCreated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(self.ownerId, forKey: .ownerId)
        try container.encode(self.ownerFullname, forKey: .ownerFullname)
        try container.encode(self.ownerPhoneNumber, forKey: .ownerPhoneNumber)
        try container.encode(self.animalDocId, forKey: .animalDocId)
        try container.encode(self.animalBreed, forKey: .animalBreed)
        try container.encode(self.animalDescription, forKey: .animalDescription)
        try container.encode(self.animalType, forKey: .animalType)
        try container.encode(self.animalPrice, forKey: .animalPrice)
        try container.encode(self.animalLocation, forKey: .animalLocation)
        try container.encode(self.dataCreated, forKey: .dataCreated)
    }
}
