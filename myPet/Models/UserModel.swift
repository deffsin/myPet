//
//  UserModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import Foundation

struct UserModel: Codable { // used in UserManager
    let userId: String
    let email: String?
    let name: String?
    let dataCreated: Date?
    
    init(auth: AuthDataResultModel) {
        self.userId = auth.uid
        self.email = auth.email
        self.name = auth.name
        self.dataCreated = Date()
    }
    
    init(
    userId: String,
    email: String? = nil,
    name: String? = nil,
    dataCreated: Date? = nil
    ) {
        self.userId = userId
        self.email = email
        self.name = name
        self.dataCreated = dataCreated
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case email = "email"
        case name = "name"
        case dataCreated = "data_created"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userId = try container.decode(String.self, forKey: .userId)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.dataCreated = try container.decodeIfPresent(Date.self, forKey: .dataCreated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.userId, forKey: .userId)
        try container.encodeIfPresent(self.email, forKey: .email)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.dataCreated, forKey: .dataCreated)
    }
}
