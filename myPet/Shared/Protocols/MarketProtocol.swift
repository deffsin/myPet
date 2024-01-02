//
//  MarketProtocol.swift
//  myPet
//
//  Created by Denis Sinitsa on 02.01.2024.
//

import Foundation
import FirebaseFirestore

protocol MarketProtocol {
    func animalInformationCollection(userId: String) -> CollectionReference
    func animalInformationDocument(userId: String, animalInformationId: String) -> DocumentReference
    func getFirstAnimal(userId: String) async throws -> AnimalModel?
    func getAllAnimals() async throws -> [AnimalModel]
    func addAnimalToMarket(ownerId: String, ownerFullname: String, ownerPhoneNumber: String, animalDocId: String, animalBreed: String, animalDescription: String, animalType: String, animalPrice: String, animalLocation: String, dataCreated: Date) async throws
}
