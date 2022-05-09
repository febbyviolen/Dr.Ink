//
//  PlantView.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/02.
//

import SwiftUI

struct PlantView: View {
    @FetchRequest(
            entity: DailyWater.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \DailyWater.date, ascending: true)],
            predicate: NSPredicate(format: "date >= %@ && date <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400 ) as CVarArg),
            animation: .default)
    var dailyWaterList: FetchedResults<DailyWater>

    @Environment(\.managedObjectContext) var context
    
    @State var startAnimation: CGFloat = 0.0
    @State var goal: Int = 2000
    
    var body: some View {
        ZStack{
            Background()
            VStack(spacing: 10){
                Spacer()
                Text("오늘의 목표")
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkDarkBlue"))
                    .font(.title)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 5)
                        .foregroundColor(Color.black.opacity(0))
                        .frame(width: 300, height: 69)
                        .shadow(color: .gray, radius: 3, x: 1, y: 3)
                        
                    VStack{
                        HorizontalWave(startAnimation: $startAnimation)
                        .frame(width: 159, height: 290)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    
                    HStack(){
                        Spacer()
                        Text("\(Int((dailyWaterList.first == nil ? 0 : dailyWaterList.first!.intake) * 100 / (dailyWaterList.first == nil ? 1 : dailyWaterList.first!.goal)))%")
                            .bold()
                            .font(.title3)
                            .foregroundColor(Color("DarkDarkBlue"))
                            .padding(.trailing, 70)
                    }.frame(maxWidth: UIScreen.main.bounds.width)
                }
                
                VStack{
                    Spacer()
                    Image({
                        if (dailyWaterList.first == nil ? 0 : dailyWaterList.first!.intake) / (dailyWaterList.first == nil ? 1 : dailyWaterList.first!.goal) < 0.4 {
                            return "Seed"
                        } else if (dailyWaterList.first == nil ? 0 : dailyWaterList.first!.intake) / (dailyWaterList.first == nil ? 1 : dailyWaterList.first!.goal) < 0.7 {
                            return "LittleSprout"
                        } else if (dailyWaterList.first == nil ? 0 : dailyWaterList.first!.intake) / (dailyWaterList.first == nil ? 1 : dailyWaterList.first!.goal) < 1.0 {
                            return "BigSprout"
                        } else {
                            return "Tulip"
                        }
                    }())
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.height*2/5, height: UIScreen.main.bounds.height*2/5)
                }
                Spacer()
            }
        }.onAppear {
            if dailyWaterList.count == 0 {
                let today = DailyWater(context: context)
                today.id = UUID()
                today.date = Date()
                today.intake = 0
                today.goal = 2000

                do {
                    try context.save()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct Main__Previews: PreviewProvider {
    static var previews: some View {
        PlantView()
    }
}


