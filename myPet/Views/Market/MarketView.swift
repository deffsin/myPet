//
//  HomeView.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct MarketView: View {
    @ObservedObject var marketViewModel: MarketViewModel
    
    var body: some View {
        ZStack {
            DarkBackground()
        }
    }
}

#Preview {
    MarketView(marketViewModel: MarketViewModel())
}
