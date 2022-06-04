//
//  ChallengeContent.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct ChallengeContent: View {
    @FetchRequest(
        entity: DailyWater.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \DailyWater.date, ascending: true)],
        predicate: NSPredicate(format: "date >= %@ && date <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400 ) as CVarArg),
        animation: .default)
    var dailyWaterList: FetchedResults<DailyWater>
    
    let detail: Challenge
    @State private var showingAlert = false
    @EnvironmentObject var userSetting: UserSetting
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            ScrollView {
                VStack {
                    Text("이점")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding()
                    Text(detail.advantage)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Text("챌린지 내용")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding()
                    Text(detail.content)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Button(action: {
                        self.showingAlert = true
                    }, label: {
                        Text(userSetting.challenges.contains(detail) ? "진행중" : "시작하기")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                            .background(Color("Blue"))
                            .cornerRadius(10)
                    })
                    .padding(.bottom, 100)
                    .alert(userSetting.challenges.contains(detail) ? "챌린지를 그만두었습니다." : "챌린지를 시작하였습니다.", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {
                            if let idx = userSetting.challenges.firstIndex(of: detail) {
                                userSetting.challenges.remove(at: idx)
                            } else {
                                userSetting.challenges.append(detail)
                            }
                            UserSetting.storeInUserDefaults()
                            if detail == .rowCaffeine {
                                dailyWaterList.first!.caffeineChallenge = userSetting.challenges.contains(.rowCaffeine)
                            } else if detail == .sugarFree {
                                dailyWaterList.first!.sugarChallenge = userSetting.challenges.contains(.sugarFree)                                
                            }
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct ChallengeContent_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeContent(detail: .sugarFree).environmentObject(UserSetting.shared)
    }
}
