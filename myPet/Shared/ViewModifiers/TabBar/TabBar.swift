//
//  TabBar.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

let tabBackGroundColor = Color.init(white: 0.92)

struct TabBar: View {
    @StateObject var marketViewModel = MarketViewModel()
    
    @State private var selectedTab: Tab = .market
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            tabBackGroundColor
                .ignoresSafeArea()
            
            ZStack {
                switch selectedTab {
                case .market:
                    MarketView(marketViewModel: marketViewModel, showSignInView: $showSignInView)
                }
                
                TabBarView(selectedTab: $selectedTab)
            }
        }
    }
}

#Preview {
    TabBar(showSignInView: .constant(false))
}


enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case market
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .market:
            return "pawprint"
        }
    }
}
