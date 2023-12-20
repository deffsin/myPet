//
//  ProfileViewModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 20.12.2023.
//

import Foundation

@MainActor
final class ProfileViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
