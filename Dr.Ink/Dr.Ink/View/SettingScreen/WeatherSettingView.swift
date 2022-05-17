//
//  WeatherSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct WeatherSettingView: View {
    @Binding var shouldShowModal: Bool
    @EnvironmentObject var userSetting: UserSetting
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            VStack {
                Button(action: {
                    userSetting.weather = .hot
                    shouldShowModal = false
                }, label: {
                    Text("더움")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                .cornerRadius(10)
                
                Button(action: {
                    userSetting.weather = .warm
                    shouldShowModal = false
                }, label: {
                    Text("따뜻함")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                
                .cornerRadius(10)
                Button(action: {
                    userSetting.weather = .cool
                    shouldShowModal = false
                }, label: {
                    Text("시원함")
                    .font(.system(size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                })
                .padding(/*@START_MENU_TOKEN@*/.all, 9.0/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width * 0.7)
                .background(Color("Blue"))
                .cornerRadius(10)
                
                Button(action: {
                    userSetting.weather = .cold
                    shouldShowModal = false
                }, label: {
                    Text("추움")
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

struct WeatherSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingView(shouldShowModal: .constant(false))
    }
}
