//
//  Dr_InkApp.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

@main
struct Dr_InkApp: App {
    let manager = CoreDataManager.shared
    
    var body: some Scene {
        WindowGroup {
            MainTabBar()
                .environment(\.managedObjectContext, manager.mainContext)
                .onAppear {
                    UserSetting.fetchFromUserDefaults()
                }
                .onDisappear {
                    UserSetting.storeInUserDefaults()
                }
        }
    }
}
