//
//  BottomSheetViewModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 29.12.2023.
//

import Foundation

@MainActor
final class BottomSheetViewModel: ObservableObject {
    // @Published private(set) var user: UserModel? = nil ????????
    @Published var animalBreed: String = ""
    @Published var animalDescription: String?
    @Published var animalType: String = ""
    @Published var animalPrice: Int = 0
    @Published var animalLocation: String?
    @Published var dataCreated: Date?
    // photos
}
