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
    @StateObject var profileViewModel = ProfileViewModel()
    
    @State private var selectedTab: Tab = .market
    @State var showSheetInMarketView: Bool
    
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            tabBackGroundColor
                .ignoresSafeArea()
            
            ZStack {
                switch selectedTab {
                case .market:
                    MarketView(marketViewModel: marketViewModel, showSheet: $showSheetInMarketView)
                case .shop:
                    ShopView()
                case .missingPets:
                    MissingPetsView()
                case .clinics:
                    ClinicsView()
                case .profile:
                    ProfileView(profileViewModel: profileViewModel, showSignInView: $showSignInView)
                }
                
                TabBarView(selectedTab: $selectedTab)
                    .overlay(BottomSheetView(isShowing: $showSheetInMarketView, height: 600))
            }
        }
    }
}

#Preview {
    TabBar(showSheetInMarketView: false, showSignInView: .constant(false))
}


enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case market, shop, missingPets, clinics, profile
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .market:
            return "pawprint"
        case .shop:
            return "basket"
        case .missingPets:
            return "bolt"
        case .clinics:
            return "cross"
        case .profile:
            return "person"
        }
    }
}
