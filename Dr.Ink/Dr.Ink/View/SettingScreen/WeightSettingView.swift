//
//  WeightSettingView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/16.
//

import SwiftUI

struct WeightSettingView: View {
    @Binding var shouldShowModal: Bool
    
    var body: some View {
        Text("WeightSettingView")
    }
}

struct WeightSettingView_Previews: PreviewProvider {
    static var previews: some View {
        WeightSettingView(shouldShowModal: .constant(false))
    }
}
