//
//  SocialMediaButton.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct SocialMediaButton: View {
    var imageName: String
    var socialName: String
    var action: () async throws -> Void // async throws was
    @Binding var showSignInView: Bool

    var body: some View {
        
        Button(action: {
            Task {
                do {
                    try await action()
                    showSignInView = false
                } catch {
                    print(error)
                }
            }
        }) {
            HStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                
                Text(socialName)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
        }
        .padding(.horizontal, 40)
        .frame(height: 45)
    }
}

#Preview {
    AuthenticationView(showSignInView: .constant(false))
}
