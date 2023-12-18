//
//  AuthenticationView.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices

struct AuthenticationView: View {
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {
                SocialMediaButton(imageName: "apple", socialName: "Sign in with Apple", action: viewModel.signInApple, showSignInView: $showSignInView)
                SocialMediaButton(imageName: "google", socialName: "Sign in with Google", action: viewModel.signInGoogle, showSignInView: $showSignInView)
            }
            .offset(y: -60)
        }
    }
}

#Preview {
    AuthenticationView(showSignInView: .constant(false))
}
