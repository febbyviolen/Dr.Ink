//
//  ChallengeContent.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct ChallengeContent: View {
    let detail: ChallengeDetail
    
    var body: some View {
        ZStack {
            Color("LightLightBlue")
                .opacity(0.3)
            ScrollView {
                VStack {
                    Text("이점")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding()
                    Text(detail.advantage)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                    Text("챌린지 내용")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .padding()
                    Text(detail.content)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .padding()
                    Spacer()
                }
            }.frame(width: UIScreen.main.bounds.width)
        }
    }
}

struct ChallengeContent_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeContent(detail: .sugarFree)
    }
}
