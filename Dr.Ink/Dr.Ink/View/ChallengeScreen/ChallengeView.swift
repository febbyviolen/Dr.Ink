//
//  ChallengeView.swift
//  Dr.Ink
//
//  Created by Inwoo Park on 2022/05/09.
//

import SwiftUI

struct ChallengeView: View {
    @Binding var showModal: Bool
    @Binding var modalContent: ModalContent?
    
    var body: some View{
        ZStack {
            Background()
            
            VStack{
                Text("챌린지")
                    .fontWeight(.bold)
                    .foregroundColor(Color("DarkDarkBlue"))
                    .font(.title)
                    .offset(y: -60)
                    

                Button(action: {
                    modalContent = .challengeSugarFree
                    showModal = true
                }, label: {
                    HStack(alignment: .center, spacing: 10) {
                        Image("cok")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        Text("무설탕으로 마시기")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image("bub")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .frame(width: 350, height: 160)
                    .background(Color(red: 0.161, green: 0.349, blue: 0.51))
                    .cornerRadius(30)
                    .padding(.bottom, 40)
                })
               
                
                Button(action: {
                    modalContent = .challengeLowCaffeine
                    showModal = true
                }, label: {
                    HStack(alignment: .center, spacing: 5) {
                        Image("cof")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                        Text("저카페인으로 마시기")
                            .font(.system(size: 22))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Image("tea")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                    .frame(width: 350, height: 160)
                    .background(Color(red: 0.435, green: 0.671, blue: 0.816))
                    .cornerRadius(30)
                    .padding(.bottom, 40)
                })

            }            
        }
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(showModal: .constant(false), modalContent: .constant(nil))
    }
}


