//
//  DarkBackground.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct DarkBackground: View {
    var lightColor = Color(red: 0.38, green: 0.38, blue: 0.41)
    var darkColor = Color(red: 0.1, green: 0.1, blue: 0.12)
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [lightColor, darkColor], startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    DarkBackground()
}
