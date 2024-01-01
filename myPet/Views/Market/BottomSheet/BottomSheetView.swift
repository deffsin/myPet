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
    
    var height: CGFloat = 600

    var body: some View {
        
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            isShowing = false
                        }
                    }
                
                VStack(alignment: .leading) {
                    HStack {
                        Spacer()
                        Button(action: {
                            isShowing = false
                        }) {
                            Text("Close")
                                .font(.fontSemiBoldSmall)
                                .foregroundStyle(.white)
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 15) {
                        InputField(text: $bottomSheetViewModel.animalBreed, title: "Animal breed:", keyboardType: .alphabet, customWidth: 200)
                        InputField(text: $bottomSheetViewModel.animalDescription, title: "Description:", keyboardType: .default, customWidth: 200) // TextEditor...
                        InputField(text: $bottomSheetViewModel.animalType, title: "Animal type:", keyboardType: .default, customWidth: 200)
                        InputField(text: $bottomSheetViewModel.animalPrice, title: "Price:", keyboardType: .numbersAndPunctuation, customWidth: 70)
                        InputField(text: $bottomSheetViewModel.animalLocation, title: "Location:", keyboardType: .default, customWidth: 200)
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                bottomSheetViewModel.addAnimalToMarket(animalBreed: bottomSheetViewModel.animalBreed, animalDescription: bottomSheetViewModel.animalDescription, animalType: bottomSheetViewModel.animalType, animalPrice: bottomSheetViewModel.animalPrice, animalLocation: bottomSheetViewModel.animalLocation, dataCreated: Date())
                            }) {
                                Text("Add to market")
                                    .font(.fontSemiBoldMedium)
                                    .foregroundStyle(.white)
                                    .frame(width: 135, height: 30)
                                    .padding(5)
                                    .background(Color(appColor: .greenColor))
                                    .cornerRadius(5)
                                    .padding(.top, 15)
                            }
                            Spacer()
                        }
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
