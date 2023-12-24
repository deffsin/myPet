//
//  AppColor.swift
//  myPet
//
//  Created by Denis Sinitsa on 20.12.2023.
//

import SwiftUI

enum AppColor {
    case greenColor
    case whiteColor
    case lightColorBackground
    case darkColorBackground
    
    var associatedColor: UIColor {
        switch self {
        case .greenColor:
            return UIColor(red: 0.10, green: 0.75, blue: 0.40, alpha: 1.0)
        case .whiteColor:
            return UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0)
        case .lightColorBackground:
            return UIColor(red: 0.38, green: 0.38, blue: 0.41, alpha: 1.0)
        case .darkColorBackground:
            return UIColor(red: 0.1, green: 0.1, blue: 0.12, alpha: 1.0)
        }
    }
}

extension Color {
    init(appColor: AppColor) {
        self.init(uiColor: appColor.associatedColor)
    }
}
