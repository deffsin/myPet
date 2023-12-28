//
//  HomeView.swift
//  myPet
//
//  Created by Denis Sinitsa on 18.12.2023.
//

import SwiftUI

struct MarketView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var marketViewModel: MarketViewModel
    
    @State private var scrollOffset: CGFloat = 0
    @State private var isStarFilled: Bool = false
    
    @Binding var showSheet: Bool
    
    var body: some View {
        NavigationStack {
            buildMainContent()
        }
    }
    
    @ViewBuilder
    func buildMainContent() -> some View {
        ZStack {
            DarkBackground()
            
            ScrollView {
                
                VStack(spacing: 15) {
                    ForEach(0...4, id: \.self) { cell in
                        NavigationLink(destination: EmptyView()) {
                            buildCell(fullname: "Alice", petname: "Bruh", description: "Good pet")
                        }
                    }
                }
                .background(GeometryReader {
                    Color.clear.preference(key: ViewOffsetKey.self, value: $0.frame(in: .global).minY)
                })
                .padding(.horizontal, 15)
                .padding(.top, 50)
            }
            .onPreferenceChange(ViewOffsetKey.self) { offset in
                withAnimation {
                    self.scrollOffset = offset
                }
            }
            .overlay {
                overlayView(offset: scrollOffset)
            }
        }
    }
    
    func buildCell(fullname: String, petname: String, description: String) -> some View {
        ZStack {
            VStack {
                HStack(spacing: 15) {
                    Text("a") // image
                        .frame(width: 115)
                        .frame(maxHeight: .infinity)
                        .background(.cyan)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            HStack(spacing: 2) {
                                Image(systemName: "camera")
                                    .font(.system(size: 13))
                                Text("7")
                                    .font(.fontRegularUltraSmall)
                            }
                            .opacity(0.7)
                            .offset(x: -35, y: 40)
                        }
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text("Breed")
                                .font(.fontSemiBoldMedium)
                            Spacer()
                            Button(action: {
                                isStarFilled.toggle()
                            }) {
                                Image(systemName: isStarFilled ? "star.fill" : "star")
                                    .foregroundColor(isStarFilled ? Color.yellow : Color.black)
                                    .opacity(isStarFilled ? 1 : 0.4)
                                    .offset(x: 15, y: 5)
                            }
                        }
                        
                        Text("500$")
                            .font(.fontRegularSmall)
                        Spacer()
                        
                        HStack {
                            Text("Tallinn, Estonia")
                                .font(.fontSemiBoldUltraSmall)
                            Spacer()
                            Text("20.12.23")
                                .font(.fontRegularUltraSmall)
                        }
                        .padding(.bottom, 3)
                    }
                    .padding(.top, 5)
                    Spacer()
                }
            }
            .padding(5)
        }
        .foregroundStyle(.black)
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(.white.opacity(0.4))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.green, lineWidth: 1)
        )
    }
    
    func overlayView(offset: CGFloat) -> some View {
        let maxOffset: CGFloat = 20.0
        let limitedOffset = min(maxOffset, abs(offset)) * (offset < 0 ? -2 : 2)
        
        let isDarkMode = colorScheme == .dark
        let isNegativeOffset = offset < 0
        
        return ZStack {
            Group {
                if isDarkMode {
                    isNegativeOffset ? Color(red: 0.10, green: 0.10, blue: 0.10) : Color(red: 0.06, green: 0.06, blue: 0.06)
                } else {
                    isNegativeOffset ? Color(red: 0.90, green: 0.90, blue: 0.90) : Color.white
                }
            }
            .ignoresSafeArea(.all)
            
            HStack {
                Text("Market")
                    .offset(x: -limitedOffset * -0.1)
                Spacer()
                
                Button(action: {
                    showSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .padding(9)
                        .background(Circle().fill(Color(appColor: .greenColor)))
                        .frame(width: 39, height: 39)
                        .offset(x: -limitedOffset * 0.1)
                        .padding(.bottom, 3)
                }
            }
            .font(.fontSemiBoldLarge)
            .padding(.horizontal, 15)
            .padding(.vertical, 7)
        }
        .frame(height: 35)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    MarketView(marketViewModel: MarketViewModel(), showSheet: .constant(false))
}
