//
//  DarkBackground.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct DarkBackground: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(appColor: .lightColorBackground), Color(appColor: .darkColorBackground)], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    DarkBackground()
}
