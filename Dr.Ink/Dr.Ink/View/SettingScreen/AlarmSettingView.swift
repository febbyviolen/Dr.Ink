//
//  AlarmSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct AlarmSettingView: View {
    @Binding var shouldShowModal: Bool
    
    var body: some View {
        Text("AlarmSettingView")
    }
}

struct AlarmSettingView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmSettingView(shouldShowModal: .constant(false))
    }
}
