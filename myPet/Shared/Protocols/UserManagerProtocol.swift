//
//  UserManagerProtocol.swift
//  myPet
//
//  Created by Denis Sinitsa on 31.12.2023.
//

import Foundation
import FirebaseFirestore

protocol UserManagerProtocol {
    func createNewUser(user: UserModel) async throws
    func getUser(userId: String) async throws -> UserModel
    func animalInformationCollection(userId: String) -> CollectionReference
    func animalInformationDocument(userId: String, animalInformationId: String) -> DocumentReference
    func getFirstAnimal(userId: String) async throws -> AnimalModel?
    func getAllAnimals() async throws -> [AnimalModel]
    func addAnimalToMarket(ownerId: String, ownerFullname: String, ownerPhoneNumber: String, ownerDocId: String, animalBreed: String, animalDescription: String, animalType: String, animalPrice: Int, animalLocation: String, dataCreated: Date) async throws
}
