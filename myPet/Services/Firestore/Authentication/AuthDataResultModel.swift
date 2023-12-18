//
//  AuthDataResultModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let name: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.name = user.displayName // displayName??
    }
}
