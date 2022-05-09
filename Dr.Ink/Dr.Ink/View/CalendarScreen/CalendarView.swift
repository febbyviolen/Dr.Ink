//
//  CalendarView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct CalendarView: View {
    @FetchRequest(sortDescriptors: [SortDescriptor(\DailyWater.date, order: .forward)])
    var dailyWaterList: FetchedResults<DailyWater>
    
    var body: some View {
        ZStack {
            Background()
            
            VStack {
                Text("기록")
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkDarkBlue"))
                    .font(.title)
                Divider()
                ScrollView {
                    LazyVStack {
                        ForEach(dailyWaterList) { dailyWater in
                            Text("\(dailyWater.date!)")
                            Text("\(Int(dailyWater.intake)) / \(Int(dailyWater.goal))")
                            Divider()
                        }
                    }                    
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity, alignment: .top)
            
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
