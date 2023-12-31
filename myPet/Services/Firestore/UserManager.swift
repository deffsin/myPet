//
//  UserManager.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


final class UserManager: UserManagerProtocol {
    static let shared = UserManager()
    private init() {}
    
    private let userCollection: CollectionReference = Firestore.firestore().collection("users")
    
    private func userDocument(userId: String) -> DocumentReference {
        userCollection.document(userId)
    }
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        return decoder
    }()
    
    func createNewUser(user: UserModel) async throws {
        do {
            try userDocument(userId: user.userId).setData(from: user, merge: false)
        } catch {
            throw UserManagerError.connectionFailed
        }
    }
    
    func getUser(userId: String) async throws -> UserModel {
        do {
            let user = try await userDocument(userId: userId).getDocument(as: UserModel.self)
            return user
            
        } catch {
            throw UserManagerError.connectionFailed
        }
    }
    
    func animalInformationCollection(userId: String) -> CollectionReference {
        userDocument(userId: userId).collection("animal_information")
    }
    
    func animalInformationDocument(userId: String, animalInformationId: String) -> DocumentReference {
        animalInformationCollection(userId: userId).document(animalInformationId)
    }
    
    func getFirstAnimal(userId: String) async throws -> AnimalModel? {
        do {
            let snapshot = try await animalInformationCollection(userId: userId).getDocuments()
            let documents = snapshot.documents
            if let firstDocument = documents.first {
                return try? firstDocument.data(as: AnimalModel.self)
            }
            return nil
        } catch {
            throw UserManagerError.connectionFailed
        }
    }
    
    func getAllAnimals() async throws -> [AnimalModel] {
        var allAnimals: [AnimalModel] = []
        
        do {
            let snapshot = try await userCollection.getDocuments()
            let userDocuments = snapshot.documents
            
            for userDoc in userDocuments {
                let userId = userDoc.documentID
                
                if let animal = try? await getFirstAnimal(userId: userId) {
                    allAnimals.append(animal)
                }
            }
            return allAnimals
        } catch {
            throw UserManagerError.connectionFailed
        }
    }
    
    func addAnimalToMarket(ownerId: String, ownerFullname: String, ownerPhoneNumber: String, ownerDocId: String, animalBreed: String, animalDescription: String, animalType: String, animalPrice: Int, animalLocation: String, dataCreated: Date) async throws {
        do {
            let document = animalInformationCollection(userId: ownerId).document()
            let documentId = document.documentID
             
            let data: [String:Any] = [
                AnimalModel.CodingKeys.ownerId.rawValue : documentId,
                AnimalModel.CodingKeys.ownerFullname.rawValue : ownerFullname,
                AnimalModel.CodingKeys.ownerPhoneNumber.rawValue : ownerPhoneNumber,
                AnimalModel.CodingKeys.ownerDocId.rawValue : ownerDocId,
                AnimalModel.CodingKeys.animalBreed.rawValue : animalBreed,
                AnimalModel.CodingKeys.animalDescription.rawValue : animalDescription,
                AnimalModel.CodingKeys.animalType.rawValue : animalType,
                AnimalModel.CodingKeys.animalPrice.rawValue : animalPrice,
                AnimalModel.CodingKeys.animalLocation.rawValue : animalLocation,
                AnimalModel.CodingKeys.dataCreated.rawValue : dataCreated
            ]
            try await document.setData(data, merge: false)
        } catch {
            throw UserManagerError.connectionFailed
        }
    }
}
