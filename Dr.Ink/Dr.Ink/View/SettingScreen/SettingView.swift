//
//  SettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct SettingView: View {
    @Binding var showModal: Bool
    @Binding var modalContent: ModalContent?
    @Environment(\.managedObjectContext) var context
    @EnvironmentObject var userSetting: UserSetting
    
    let settingList: [(modalContent: ModalContent, name: String)] = [
        (modalContent: ModalContent.alarmSetting, name: "알림"),
        (modalContent: ModalContent.genderSetting, name: "성별"),
        (modalContent: ModalContent.weightSetting, name: "체중"),
        (modalContent: ModalContent.activitySetting, name: "활동량"),
        (modalContent: ModalContent.weatherSetting, name: "날씨")
    ]
    
    var body: some View {
        VStack {
            Spacer()
            LazyVStack {
                ForEach(0..<5) { idx in
                    Button(action: {
                        modalContent = settingList[idx].modalContent
                        showModal = true
                    }, label: {
                        HStack(alignment: .center, spacing: 5) {
                            Text(settingList[idx].name)
                                .font(.system(size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.leading, 30.0)
                            Spacer()
                            if idx == 1 {
                                Text("\(userSetting.gender.rawValue)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10.0)
                            } else if idx == 2 {
                                Text("\(userSetting.weight)kg")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10.0)
                            } else if idx == 3 {
                                Text("\(userSetting.activity.rawValue)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10.0)
                            } else if idx == 4 {
                                Text("\(userSetting.weather.rawValue)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .padding(.trailing, 10.0)
                            }
                            Image(systemName: "chevron.right")
                                .renderingMode(.template)
                                .foregroundColor(.black)
                                .padding(.trailing, 30.0)
                        }
                        .cornerRadius(30)
                        .padding(.bottom, 40)
                    })
                }
            }
            Text("권장수분량\n\(userSetting.needWater)ml")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
            Spacer()
        }.background {
            BackgroundView()
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(showModal: .constant(false), modalContent: .constant(.none))
            .environmentObject(UserSetting.shared)
            .previewInterfaceOrientation(.portrait)
    }
}
