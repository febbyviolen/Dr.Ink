//
//  LiquidModel.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/04.
//

import Foundation

struct LiquidModel: Identifiable, Codable { // 음료 모델
    let id: String
    let drinkName: String // DrinkList.label과 동일한 값
    let amount: Int
    
    init(id: String = UUID().uuidString, drinkName: String, amount:Int){
        self.id = id
        self.drinkName = drinkName
        self.amount = amount
    }
    
    func updateCompletion(newAmount: Int) -> LiquidModel {
        return LiquidModel(id: id, drinkName: drinkName, amount: newAmount)
    }
}
