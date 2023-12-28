//
//  BottomSheetViewModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 29.12.2023.
//

import Foundation

@MainActor
final class BottomSheetViewModel: ObservableObject {
    @Published var petBreed: String = ""
    @Published var petDescription: String = ""
    @Published var petType: String = ""
    @Published var petPrice: Int = 0
    @Published var petLocation: String = ""
    // photos
}
