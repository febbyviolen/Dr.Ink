//
//  WaterView.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/03.
//

import SwiftUI

struct WaterView: View {
    
    @Binding var shouldShowModal: Bool
    let drinks: [Drink]
    
    @State var progress : CGFloat = 0.0
    @State var startAnimation : CGFloat = 0.0
    @State var ml : Int = 0
    @State var fillColor = Color("LightLightBlue")
    @State var Drinkselected : Drink = .water
    
    var body: some View {
        VStack(spacing: 5) {
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    shouldShowModal = false
                }, label: {
                    Text("X")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                })
                .padding(.trailing, 35.0)
            }
            
            HStack{
                Spacer()
                WaveAnimation(progress: $progress, startAnimation: $startAnimation, fillColor: $fillColor)
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5, maxHeight: UIScreen.main.bounds.height/2)
                PlusMinButton
                Spacer()
            }
            AnotherButton
            Spacer()
            
            ScrollView(.horizontal){
                HStack(spacing: 50){
                    ForEach(drinks, id: \.self){drink in
                        ChooseDrink(drink: drink)
                            .onTapGesture {
                                DispatchQueue.main.async {
                                    self.Drinkselected = drink
                                    fillColor = getColor()
                                }
                            }
                    }
                }
            }
            .environment(\.layoutDirection, .rightToLeft)
            .frame(height: UIScreen.main.bounds.height/8)
            .padding(.horizontal)

            Spacer()
        }
    }
}


//MARK : PREVIEWS
struct Water_Previews: PreviewProvider {
    static var previews: some View {
        WaterView(shouldShowModal: .constant(false), drinks: [.water, .greenTea, .coffee])
    }
}

extension WaterView{
    private func ChooseDrink(drink: Drink) -> some View {
        VStack(){
            Spacer()
            Image(drink.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 61, height: 69)
            Text(drink.label)
                .foregroundColor(drink.color)
                .fontWeight(.semibold)
                .padding(.top, 10)
        }
    }
    
    var PlusMinButton : some View {
        VStack{
            Button(action: {
                if ml < 1000 {
                    progress = progress + 0.1
                    ml += 100
                }
            },label:{
                Image("PlusWaterBtn")
            })
            
            Button(action: {
                if ml > 0 {
                    progress = progress - 0.1
                    ml = ml - 100
                }
            },label:{
                Image("MinWaterBtn")
            })
        }
    }
    
    var AnotherButton : some View {
        HStack(spacing: 20){
            Text("\(ml)ml")
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 125, height: 55)
                .background(Color("DarkGreen"))
                .cornerRadius(24)
            
            Button(action: {
                addButtonPressed()
            }, label: {
                Text("+ 추가")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 85, height: 55)
                    .background(Color("DarkGreen"))
                    .cornerRadius(24)
            })
        }
    }
    
    func getColor() -> Color{
        return Drinkselected.color
    }
    
    func addButtonPressed() {
        progress = 0
        ml = 0
    }
}
