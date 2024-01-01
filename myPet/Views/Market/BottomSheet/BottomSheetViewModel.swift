//
//  BottomSheetViewModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 29.12.2023.
//

import Foundation

@MainActor
final class BottomSheetViewModel: ObservableObject {
    @Published private(set) var user: UserModel? = nil
    
    @Published var ownerPhoneNumber: String = ""
    @Published var animalBreed: String = ""
    @Published var animalDescription: String = ""
    @Published var animalType: String = ""
    @Published var animalPrice: String = ""
    @Published var animalLocation: String = ""
    @Published var dataCreated: Date?
    // photos
    
    @Published var messageToUser: String = ""
    @Published var isShowingSnackBar: Bool = false
    
    func loadCurrentUser() async throws {
        let authDataResult = try AuthenticationManager.shared.authenticatedUser()
        self.user = try await UserManager.shared.getUser(userId: authDataResult.uid)
    }
    
    func addAnimalToMarket(animalBreed: String, animalDescription: String, animalType: String, animalPrice: String, animalLocation: String, dataCreated: Date) {
        Task {
            do {
                let authDataResult = try AuthenticationManager.shared.authenticatedUser()
                
                try? await UserManager.shared.addAnimalToMarket(ownerId: authDataResult.uid, ownerFullname: authDataResult.name!, ownerPhoneNumber: ownerPhoneNumber, animalDocId: user!.userId, animalBreed: animalBreed, animalDescription: animalDescription, animalType: animalType, animalPrice: animalPrice, animalLocation: animalLocation, dataCreated: dataCreated)
                isShowingSnackBar = true
                messageToUser = "The animal was successfully added 🎉"
            } catch {
                isShowingSnackBar = true
                messageToUser = "Failed to add the animal ❌"
            }
        }
    }
}
