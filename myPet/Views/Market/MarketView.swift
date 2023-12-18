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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MarketView(marketViewModel: MarketViewModel())
}
