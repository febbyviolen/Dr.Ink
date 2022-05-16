//
//  ActivitySettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct ActivitySettingView: View {
    @Binding var shouldShowModal: Bool
    
    var body: some View {
        Text("ActivitySettingView")
    }
}

struct ActivitySettingView_Previews: PreviewProvider {
    static var previews: some View {
        ActivitySettingView(shouldShowModal: .constant(false))
    }
}
