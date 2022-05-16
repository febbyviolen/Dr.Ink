//
//  WeatherSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct WeatherSettingView: View {
    @Binding var shouldShowModal: Bool
    
    var body: some View {
        Text("WeatherSettingView")
    }
}

struct WeatherSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSettingView(shouldShowModal: .constant(false))
    }
}
