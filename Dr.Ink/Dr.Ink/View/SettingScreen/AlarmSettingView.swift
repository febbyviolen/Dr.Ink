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
            VStack(spacing:3) {
                Toggle("ON/OFF", isOn: $onOff)
                    .padding(.horizontal, 50.0)
                    .frame(height: 60.0)
                    .font(.body)
                DatePicker("알람 시간", selection: $time, displayedComponents: [.hourAndMinute])
                    .padding(.horizontal, 50.0)
                    .frame(height: 60.0)
                    .font(.body)
                Button(action: {
                    if onOff {
                        NotificationManager.shared.setAlarm(date: time)
                    } else {
                        NotificationManager.shared.removeAlarm()
                    }
                    userSetting.alarm = Alarm(time: time, onOff: onOff)
                    UserSetting.storeInUserDefaults()
                    shouldShowModal = false
                }, label: {
                    Text("저장")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("Blue"))
                        .cornerRadius(10)
                        
                }).padding(.horizontal, 45)
                    .padding(.vertical)
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
