//
//  BottomSheetView.swift
//  myPet
//
//  Created by Denis Sinitsa on 24.12.2023.
//

import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var bottomSheetViewModel: BottomSheetViewModel
    
    @Binding var isShowing: Bool
    
    var height: CGFloat = 100

    var body: some View {
        
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Sheet!")
                        Spacer()
                        Button(action: {
                            isShowing = false
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 22))
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color(appColor: .greenColor))
                                .clipShape(Circle())
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding([.horizontal, .vertical], 15)
                .background(LinearGradient(colors: [Color(appColor: .darkColorBackground), Color(appColor: .lightColorBackground)], startPoint: .top, endPoint: .bottom).opacity(0.6))
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
        
    }
}

#Preview {
    BottomSheetView(bottomSheetViewModel: BottomSheetViewModel(), isShowing: .constant(true))
}
