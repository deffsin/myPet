//
//  BottomSheetView.swift
//  myPet
//
//  Created by Denis Sinitsa on 24.12.2023.
//

import SwiftUI

struct BottomSheetView: View {
    @ObservedObject var bottomSheetViewModel: BottomSheetViewModel
    
    @State private var snackBarTimer: DispatchWorkItem?
    
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
                                    .frame(width: 135, height: 30)
                                    .padding(.top, 20)
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
                .overlay {
                    if bottomSheetViewModel.isShowingSnackBar {
                        SnackBarView(isShowing: $bottomSheetViewModel.isShowingSnackBar, message: bottomSheetViewModel.messageToUser)
                            .onAppear(perform: startSnackBarTimer)
                            .offset(y: 200)
                    }
                }
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: isShowing)
        .task {
            try? await bottomSheetViewModel.loadCurrentUser()
        }
    }
    
    private func startSnackBarTimer() {
        snackBarTimer?.cancel()

        let item = DispatchWorkItem {
            withAnimation {
                bottomSheetViewModel.isShowingSnackBar = false
            }
        }

        snackBarTimer = item
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: item)
    }
}

#Preview {
    BottomSheetView(bottomSheetViewModel: BottomSheetViewModel(), isShowing: .constant(true))
}
