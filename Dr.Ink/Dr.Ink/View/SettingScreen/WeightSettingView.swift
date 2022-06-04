//
//  WeightSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct WeightSettingView: View {
    @Binding var shouldShowModal: Bool
    @EnvironmentObject var userSetting: UserSetting
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            VStack {
                Picker("당신의 몸무게를 입력해주세요.", selection: $userSetting.weight) {
                    ForEach(0..<200) {
                        Text("\($0)")
                    }
                }
                Text("현재 상태 :   \(userSetting.weight)kg")
                    .fontWeight(.semibold)
                    .font(.body)
            }
            .pickerStyle(WheelPickerStyle())
        }
    }
}

struct WeightSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeightSettingView(shouldShowModal: .constant(false))
            .environmentObject(UserSetting.shared)
    }
}
