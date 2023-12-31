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
    
    var height: CGFloat = 700

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
                        VStack {
                            InputField(text: $bottomSheetViewModel.animalBreed, title: "Animal breed", keyboardType: .alphabet)
                            InputField(text: $bottomSheetViewModel.animalDescription, title: "Description", keyboardType: .default)
                            InputField(text: $bottomSheetViewModel.animalType, title: "Animal type", keyboardType: .default)
                            InputField(text: $bottomSheetViewModel.animalPrice, title: "Price", keyboardType: .numbersAndPunctuation)
                            InputField(text: $bottomSheetViewModel.animalLocation, title: "Location", keyboardType: .default)
                        }
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
                    
                    Button(action: {
                        bottomSheetViewModel.addAnimalToMarket(animalBreed: bottomSheetViewModel.animalBreed, animalDescription: bottomSheetViewModel.animalDescription, animalType: bottomSheetViewModel.animalType, animalPrice: bottomSheetViewModel.animalPrice, animalLocation: bottomSheetViewModel.animalLocation, dataCreated: Date())
                        
                    }) {
                        Text("Add to market!")
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding([.horizontal, .vertical], 15)
                .background(.ultraThinMaterial)
                .cornerRadius(16, corners: [.topLeft, .topRight])
                .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
        .task {
            try? await bottomSheetViewModel.loadCurrentUser()
        }
        
    }
}

#Preview {
    BottomSheetView(bottomSheetViewModel: BottomSheetViewModel(), isShowing: .constant(true))
}
