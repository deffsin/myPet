//
//  ProfileView.swift
//  myPet
//
//  Created by Denis Sinitsa on 20.12.2023.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Button(action: {
                Task {
                    do {
                        try profileViewModel.signOut()
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
}

#Preview {
    ProfileView(profileViewModel: ProfileViewModel(), showSignInView: .constant(false))
}
