//
//  DrinkList.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/03.
//

import Foundation
import SwiftUI

enum Drink: Hashable {
    case water, greenTea, coffee, juice, beer, coke
    
    var imageName: String{
        switch self {
        case .water:
            return "WaterImg"
        case .greenTea:
            return "GreenTeaImg"
        case .coffee:
            return "CoffeeImg"
        case .juice:
            return "JuiceImg"
        case .beer:
            return "BeerImg"
        case .coke:
            return "CokeImg"
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
        case .juice:
            return "주스"
        case .beer:
            return "맥주"
        case .coke:
            return "콜라"
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
        case .juice:
            return Color("JuiceColor")
        case .beer:
            return Color("BeerColor")
        case .coke:
            return Color("CokeColor")
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
        case .juice:
            return false
        case .beer:
            return false
        case .coke:
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
        case .juice:
            return true
        case .beer:
            return false
        case .coke:
            return true
        }
    }
}

