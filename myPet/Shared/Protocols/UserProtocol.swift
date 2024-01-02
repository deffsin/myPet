//
//  UserProtocol.swift
//  myPet
//
//  Created by Denis Sinitsa on 31.12.2023.
//

import Foundation
import FirebaseFirestore

protocol UserProtocol {
    var userCollection: CollectionReference { get }
    func userDocument(userId: String) -> DocumentReference
    func createNewUser(user: UserModel) async throws
    func getUser(userId: String) async throws -> UserModel
}
