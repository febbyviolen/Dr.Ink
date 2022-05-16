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
        VStack {
            Spacer()
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
            Divider()
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: .infinity, alignment: .top)
        .background {
            BackgroundView()
        }
    }
}

struct Calendar_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
