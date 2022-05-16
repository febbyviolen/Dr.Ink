//
//  Background.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/02.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Circle()
                .offset(x: -25, y: -380)
                .frame(width: UIScreen.main.bounds.width+600, height: UIScreen.main.bounds.width+375)
                .foregroundColor(Color("LightBlue"))
            
            Circle()
                .offset(x: -30, y: -300)
                .frame(width: UIScreen.main.bounds.width+130, height: UIScreen.main.bounds.width+474)
                .foregroundColor(Color("DarkBlue"))
        }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
            .previewInterfaceOrientation(.portrait)
    }
}
