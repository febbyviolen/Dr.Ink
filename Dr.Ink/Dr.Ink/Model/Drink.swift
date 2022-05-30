//
//  DrinkList.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/03.
//

import Foundation
import SwiftUI

enum Drink: Hashable {
    case water, greenTea, coffee
    
    var imageName: String{
        switch self {
        case .water:
            return "WaterImg"
        case .greenTea:
            return "GreenTeaImg"
        case .coffee:
            return "CoffeeImg"
        }
    }
    
    var label: String{
        switch self {
        case .water:
            return "물"
        case .greenTea:
            return "녹차"
        case .coffee:
            return "커피"
        }
    }
    
    var color: Color{
        switch self {
        case .water:
            return Color("LightLightBlue")
        case .greenTea:
            return Color("LightGreen")
        case .coffee:
            return Color("CoffeeBrown")
        }
    }
    
    var caffeine: Bool {
        switch self {
        case .water:
            return false
        case .greenTea:
            return true
        case .coffee:
            return true
        }
    }
    
    var sugar: Bool {
        switch self {
        case .water:
            return false
        case .greenTea:
            return false
        case .coffee:
            return false
        }
    }
}

