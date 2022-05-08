//
//  Background.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/02.
//

import SwiftUI

struct Background: View { // 배경
    var body: some View {
        ZStack{
            Circle()
                .offset(x: -25, y: -380)
                .frame(width: 749, height: 755)
                .foregroundColor(Color("LightBlue"))
                
            Circle()
                .offset(x: -30, y: -300)
                .frame(width: 512, height: 470)
                .foregroundColor(Color("DarkBlue"))
            }
    }
}

struct Background_Previews: PreviewProvider {
    static var previews: some View {
        Background()
            .previewInterfaceOrientation(.portrait)
    }
}
