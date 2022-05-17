//
//  ChallengeModal.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct MainModal: View {
    @FetchRequest(
            entity: DailyWater.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \DailyWater.date, ascending: true)],
            predicate: NSPredicate(format: "date >= %@ && date <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400 ) as CVarArg),
            animation: .default)
    var dailyWaterList: FetchedResults<DailyWater>
    
    @Environment(\.managedObjectContext) var context
    
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
                        WeightSettingView(shouldShowModal: $isShowing)
                    case .activitySetting:
                        ActivitySettingView(shouldShowModal: $isShowing)
                    case .weatherSetting:
                        WeatherSettingView(shouldShowModal: $isShowing)
                    case .dailyMemo:
                        DailyMemoView()
                    default:
                        Text("Error")
                    }
                }
                .frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
                .onDisappear {
                    dailyWaterList.first!.setValue(UserSetting.shared.needWater, forKey: "goal")
                    do {
                        try context.save()
                    } catch {
                        print(error)
                    }
                }
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
