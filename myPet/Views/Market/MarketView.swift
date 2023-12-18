//
//  HomeView.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct MarketView: View {
    @ObservedObject var marketViewModel: MarketViewModel
    @Binding var showSignInView: Bool
    
    var body: some View {
        Button(action: {
            Task {
                do {
                    try marketViewModel.signOut()
                    showSignInView = true
                } catch {
                    print(error)
                }
            }
        }) {
            Text("Log out") // it should be in the settings
                .bold()
                .font(.system(size: 13))
                .foregroundColor(Color.white)
                .padding()
                .background(Color.red.opacity(0.8))
                .cornerRadius(10)
        }
    }
}

#Preview {
    MarketView(marketViewModel: MarketViewModel(), showSignInView: .constant(false))
}
