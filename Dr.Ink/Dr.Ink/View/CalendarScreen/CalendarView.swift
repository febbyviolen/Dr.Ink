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
            Text("기록")
                .fontWeight(.bold)
                .foregroundColor(Color("DarkDarkBlue"))
                .font(.title)
                .padding([.top, .bottom], 20)
            ScrollView {
                LazyVStack {
                    ForEach(dailyWaterList) { dailyWater in
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Text("\(dailyWater.date!.dateToString())")
                                    .font(.system(size: 22))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                Text("\(Int(dailyWater.intake)) / \(Int(dailyWater.goal))")
                                    .font(.system(size: 15))
                                    .foregroundColor(.black)
                            }
                            .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                            .frame(width: UIScreen.main.bounds.width * 0.7)
                            .background(Color("Blue"))
                            .cornerRadius(10)
                        })
                    }
                }
            }
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
