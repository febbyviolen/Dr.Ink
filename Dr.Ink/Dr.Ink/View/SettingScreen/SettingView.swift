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
    
    let settingList: [(modalContent: ModalContent, name: String, content: String)] = [
        (modalContent: ModalContent.alarmSetting, name: "알림", content: ""),
        (modalContent: ModalContent.genderSetting, name: "성별", content: "\(UserSetting.shared.gender)"),
        (modalContent: ModalContent.weightSetting, name: "체중", content: "\(UserSetting.shared.weight)kg"),
        (modalContent: ModalContent.activitySetting, name: "활동량", content: "\(UserSetting.shared.activity)"),
        (modalContent: ModalContent.weatherSetting, name: "날씨", content: "\(UserSetting.shared.weather)")
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
                            Text(settingList[idx].content)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.trailing, 10.0)
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
            Spacer()
        }.background {
            BackgroundView()
        }
    }
}

struct Setting_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(showModal: .constant(false), modalContent: .constant(.none))
    }
}
