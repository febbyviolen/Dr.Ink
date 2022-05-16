//
//  ChallengeModal.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct MainModal: View {
    @Binding var isShowing: Bool
    @Binding var content: ModalContent?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                VStack {
                    switch content {
                    case .challengeLowCaffeine:
                        ChallengeContent(detail: .rowCaffeine)
                    case .challengeSugarFree:
                        ChallengeContent(detail: .sugarFree)
                    case .alarmSetting:
                        AlarmSettingView(shouldShowModal: $isShowing)
                    case .genderSetting:
                        GenderSettingView(shouldShowModal: $isShowing)
                    case .weightSetting:
                        WeatherSettingView(shouldShowModal: $isShowing)
                    case .activitySetting:
                        ActivitySettingView(shouldShowModal: $isShowing)
                    case .weatherSetting:
                        WeatherSettingView(shouldShowModal: $isShowing)
                    default:
                        Text("Error")
                    }
                }
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeOut, value: isShowing)
    }
}

struct ChallengeModal_Previews: PreviewProvider {
    static var previews: some View {
        MainModal(isShowing: .constant(true), content: .constant(nil))
    }
}
