//
//  Plant.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/02.
//

import SwiftUI

struct Plant: View {
    
    @EnvironmentObject var liquid: ViewModel
    
    @State var progress : CGFloat = 0
    @State var startAnimation : CGFloat = 0.0
    @State var goal : Int = 2000
    
    var body: some View {
        
        ZStack{
            Background()
            VStack(spacing: 10){
                Spacer()
                ZStack{
                    VStack{
                        Text("오늘의 목표")
                            .fontWeight(.bold)
                            .foregroundColor(Color("DarkDarkBlue"))
                            .font(.title)
                        Spacer()
                    }.frame(width: UIScreen.main.bounds.width, height: 160)
                    
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 5)
                        .foregroundColor(Color.black.opacity(0))
                        .frame(width: 300, height: 69)
                        .shadow(color: .gray, radius: 3, x: 1, y: 3)
                        
                    VStack{
                        HorizontalWave(progress: progress, startAnimation: $startAnimation)
                        .frame(width: 159, height: 290)
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 150)
                    
                    HStack(){
                        Spacer()
                        Text("\(Int(progress*100))%")
                            .bold()
                            .font(.title3)
                            .foregroundColor(Color("DarkDarkBlue"))
                            .padding(.trailing, 70)
                    }.frame(maxWidth: UIScreen.main.bounds.width)
                }
                
                VStack{
                    Spacer()
                    Image(getImageName())
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                }
                Spacer()
            }
        }
    }
}

struct Main__Previews: PreviewProvider {
    static var previews: some View {
        Plant().environmentObject(ViewModel())
    }
}
    
extension Plant{
    
    func getProgress(){
        var prog = goal - liquid.total()
        prog = goal - prog
        progress = CGFloat(prog/10)
    }
    
    func getImageName()->String {
        switch progress {
        case progress where progress < 0.4: return "Seed"
        case progress where progress < 0.7 : return "LittleSprout"
        case progress where progress < 1.0 : return "BigSprout"
        case progress where progress == 1.0 : return "Tulip"
        default:
            return "Tulip"
        }
    }
    
}


