//
//  ChallengeContent.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct ChallengeContent: View {
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
                    .alert(userSetting.challenges.contains(detail) ? "챌린지를 그만두시겠습니까?" : "챌린지를 시작하시겠습니까?", isPresented: $showingAlert) {
                        Button("OK", role: .cancel) {
                            if let idx = userSetting.challenges.firstIndex(of: detail) {
                                userSetting.challenges.remove(at: idx)
                            } else {
                                userSetting.challenges.append(detail)
                            }
                            UserSetting.storeInUserDefaults()
                        }
                    }
                }
            }.frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct ChallengeContent_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeContent(detail: .sugarFree)
    }
}
