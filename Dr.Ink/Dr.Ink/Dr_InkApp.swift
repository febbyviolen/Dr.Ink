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
                    guard let data = UserDefaults.standard.data(forKey: UserSetting.key) else { return }
                    let decoder = JSONDecoder()
                    do {
                        let userSettring = try decoder.decode(UserSetting.self, from: data)
                        UserSetting.shared = userSettring
                        print(UserSetting.shared)
                    } catch {
                        print(error)
                    }
                }
                .onDisappear {
                    let encoder = JSONEncoder()
                    do {
                        let data = try encoder.encode(UserSetting.shared)
                        UserDefaults.standard.set(data, forKey: UserSetting.key)
                    } catch {
                        print(error)
                    }
                }
        }
    }
}
