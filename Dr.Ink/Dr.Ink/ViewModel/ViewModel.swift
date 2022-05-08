//
//  ViewModel.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/04.
//

import Foundation

class ViewModel: ObservableObject { // 상태를 기기에 저장하기 위한 모델
    @Published var items: [LiquidModel] = [] {
        didSet{
            saveItems()
        }
    }
    
    //to avoid mistakes when typing the itemskey
    let itemsKey: String = "drink_input"
    
    init(){
        fetchItems()
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    func fetchItems() { // 이름변경
        guard let data = UserDefaults.standard.data(forKey: itemsKey),
              let savedItems = try? JSONDecoder().decode([LiquidModel].self, from: data) else {
            return
        }
        
        self.items = savedItems
    }
    
    func deleteItem(idx: IndexSet){
        items.remove(atOffsets: idx)
    }
    
    func addItem(drinkName: String, amount: Int) {
        let newItem = LiquidModel(drinkName: drinkName, amount: amount)
        items.append(newItem)
    }
    
    
    func updateItem(item: LiquidModel, amount: Int) {
        if let index = items.firstIndex(where: {  $0.id == item.id }) {
            items[index] = item.updateCompletion(newAmount: amount)
        }
    }
    
    func total() -> Int {
        var total = 0
        if !items.isEmpty {
            for item in items {
                total += item.amount
            }
        }
        return total
    }
}
