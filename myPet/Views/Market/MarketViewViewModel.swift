//
//  MarketViewModel.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import Foundation

@MainActor
final class MarketViewModel: ObservableObject {
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
    }
}
