//
//  MainTabBar.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct MainTabBar: View {
    let tabBarImageNames = ["Plant","Calendar","Water","Challenge","Settings"]
    
    @State var selectedIndex = 0
    @State var shouldShowWaterFullScreen = false
    @State var shouldShowChallengeModal = false
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Spacer().fullScreenCover(isPresented: $shouldShowWaterFullScreen, content: {
                            Water(shouldShowModal: $shouldShowWaterFullScreen, drinks: [.Water, .GreenTea, .Coffee])
                    })
                    
                    switch selectedIndex {
                    case 0:
                        Plant()
                    case 1:
                        Challenge(showModal: $shouldShowChallengeModal)
                    case 3:
                        Challenge(showModal: $shouldShowChallengeModal)
                    case 4:
                        Challenge(showModal: $shouldShowChallengeModal)
                    default:
                        Text("Error")
                    }
                }
                
                Spacer()
                
                HStack {
                    ForEach(0..<5) { idx in
                        Button(action: {
                            if idx == 2 {
                                shouldShowWaterFullScreen.toggle()
                            } else {
                                selectedIndex = idx
                            }
                        }, label: {
                            Spacer()
                            if idx == 2 {
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color("DarkBlue"))
                                        .frame(width: 70)
                                    Image(tabBarImageNames[idx])
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 35, height: 35)
                                        .foregroundColor(.white)
                                }
                                .offset(y: -10)
                            } else {
                                Image(tabBarImageNames[idx])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35, height: 35)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                        })
                    }
                }.frame(width: UIScreen.main.bounds.width)
            }
            
            ChallengeModal(isShowing: $shouldShowChallengeModal)
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
