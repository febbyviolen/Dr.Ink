//
//  ActivitySettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct ActivitySettingView: View {
    @Binding var shouldShowModal: Bool
    @EnvironmentObject var userSetting: UserSetting
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            VStack {
                Button(action: {
                    userSetting.activity = .low
                    shouldShowModal = false
                }, label: {
                    Text("낮음")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                .cornerRadius(10)
                
                Button(action: {
                    userSetting.activity = .middle
                    shouldShowModal = false
                }, label: {
                    Text("중간")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                .cornerRadius(10)
                
                Button(action: {
                    userSetting.activity = .high
                    shouldShowModal = false
                }, label: {
                    Text("높음")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                .cornerRadius(10)
            }
        }
    }
}

struct ActivitySettingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySettingView(shouldShowModal: .constant(false))
    }
}
