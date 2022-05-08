//
//  DrinkList.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/03.
//

import Foundation
import SwiftUI

enum Drink: Hashable {
    case Water, GreenTea, Coffee
    
    var imageName: String{
        switch self {
        case .Water:
            return "WaterImg"
        case .GreenTea:
            return "GreenTeaImg"
        case .Coffee:
            return "CoffeeImg"
        }
    }
    
    var label: String{
        switch self {
        case .Water:
            return "물"
        case .GreenTea:
            return "녹차"
        case .Coffee:
            return "커피"
        }
    }
    
    var color: Color{
        switch self {
        case .Water:
            return Color("LightLightBlue")
        case .GreenTea:
            return Color("LightGreen")
        case .Coffee:
            return Color("CoffeeBrown")
        }
    }
    
}

