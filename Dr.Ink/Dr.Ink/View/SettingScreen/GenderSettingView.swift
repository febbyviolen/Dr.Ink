//
//  GenderSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct GenderSettingView: View {
    @Binding var shouldShowModal: Bool
    @EnvironmentObject var userSetting: UserSetting
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            VStack {
                Button(action: {
                    userSetting.gender = .man
                    shouldShowModal = false
                }, label: {
                    Text("남성")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .background(Color("Blue"))
                    .cornerRadius(10)
                })
                
                Button(action: {
                    userSetting.gender = .woman
                    shouldShowModal = false
                }, label: {
                    Text("여성")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width * 0.7)
                    .background(Color("Blue"))
                    .cornerRadius(10)
                })
            }
        }
    }
}

struct GenderSettingView_Previews: PreviewProvider {
    static var previews: some View {
        GenderSettingView(shouldShowModal: .constant(false))
            .environmentObject(UserSetting.shared)
    }
}
