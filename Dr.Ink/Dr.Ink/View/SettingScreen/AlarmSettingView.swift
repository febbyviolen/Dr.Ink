//
//  AlarmSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct AlarmSettingView: View {
    @Binding var shouldShowModal: Bool
    
    @EnvironmentObject var userSetting: UserSetting
    @State private var time = Date()
    @State private var onOff = false
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            VStack {
                Toggle("ON/OFF", isOn: $onOff)
                    .padding(.horizontal, 50.0)
                    .frame(height: 60.0)
                DatePicker("알람시간", selection: $time, displayedComponents: [.hourAndMinute])
                    .padding(.horizontal, 50.0)
                    .frame(height: 60.0)
                Button(action: {
                    if onOff {
                        NotificationManager.shared.setAlarm(date: time)
                    } else {
                        NotificationManager.shared.removeAlarm()
                    }
                    userSetting.alarm = Alarm(time: time, onOff: onOff)
                    shouldShowModal = false
                }, label: {
                    Text("저장")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                        .background(Color("Blue"))
                        .cornerRadius(10)
                })
            }
        }.onAppear {
            time = userSetting.alarm.time
            onOff = userSetting.alarm.onOff
        }
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView(shouldShowModal: .constant(false))
    }
}
