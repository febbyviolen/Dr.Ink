//
//  DailyMemoView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/17.
//

import SwiftUI

struct DailyMemoView: View {
    @State var day: DailyWater?
    
    var body: some View {
        VStack {
            if let day = day {
                Text("\(day.date!.dateToString())")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.top, 100)
                Text("이 날의 달성도: \(Int((day.intake / day.goal)) > 1 ? 100 : Int((day.intake / day.goal))*100)%")
                    .padding(.top, 5)
                HStack {
                    Text("\(Int(day.intake))")
                        .bold()
                        .padding(.top, 2)
                    Text("/ \(Int(day.goal)) ml")
                        .padding(.top, 2)
                }
                ZStack {
                    Image({
                        if (day.intake / day.goal) < 0.4 {
                            return "Seed"
                        } else if (day.intake / day.goal) < 0.7 {
                            return "LittleSprout"
                        } else if (day.intake / day.goal) < 1.0 {
                            return "BigSprout"
                        } else {
                            return "Tulip"
                        }
                    }())
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.height*3/10, height: UIScreen.main.bounds.height*3/10)
                    VStack {
                        if day.caffeineChallenge {
                            Image("blue")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.height*1/20, height: UIScreen.main.bounds.height*1/20)
                                .padding(.trailing, UIScreen.main.bounds.width*1/2)
                        }
                        if day.sugarChallenge {
                            Image("purple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.height*1/20, height: UIScreen.main.bounds.height*1/20)
                                .padding(.leading, UIScreen.main.bounds.width*1/2)
                        }
                    }
                }.padding(.bottom, 100)
            } else {
                Text("기록이 없습니다.")
            }
        }
    }
}
