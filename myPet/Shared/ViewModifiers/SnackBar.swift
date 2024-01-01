//
//  SnackBarView.swift
//  myPet
//
//  Created by Denis Sinitsa on 01.01.2024.
//

import SwiftUI

struct SnackBarView: View {
    @Binding var isShowing: Bool
    
    var message: String

    var body: some View {
        ZStack {
            if isShowing {
                HStack(alignment: .firstTextBaseline) {
                    Text(message)
                        .font(.fontSemiBoldMedium)
                        .foregroundColor(.white)
                }
                .padding(10)
                .background(Color(appColor: .greenColor))
                .cornerRadius(15)
                .frame(width: 400, height: 80)
            }
        }
    }
}
