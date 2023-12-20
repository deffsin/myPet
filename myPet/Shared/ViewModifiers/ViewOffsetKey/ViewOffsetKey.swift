//
//  ViewOffsetKey.swift
//  myPet
//
//  Created by Denis Sinitsa on 20.12.2023.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}
