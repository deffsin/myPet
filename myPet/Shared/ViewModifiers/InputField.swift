//
//  InputField.swift
//  myPet
//
//  Created by Denis Sinitsa on 29.12.2023.
//

import SwiftUI

struct InputField: View {
    @Binding var text: String
    
    var title: String
    var isValid: Bool?
    var errorMessage: String?
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.black)
            
            TextField("", text: $text)
                .padding(10)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        isValid == false ? Color.red : Color.gray.opacity(0.3), lineWidth: 1)
                )
                .keyboardType(keyboardType)
                .overlay(
                    showingError()
                        .offset(y: 35)
                )
        }
        .font(.fontSemiBoldSmall)
    }
    
    func showingError() -> some View {
        VStack {
            if let errorMessage = errorMessage, !errorMessage.isEmpty {
                Text(errorMessage)
                    .font(.fontSemiBoldUltraSmall)
                    .foregroundStyle(.red)
            }
        }
    }
}