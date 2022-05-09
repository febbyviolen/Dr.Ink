//
//  WaveAnimation.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/03.
//

import SwiftUI

struct WaveAnimation: View {
    
    @Binding var progress: CGFloat
    @Binding var startAnimation: CGFloat
    @Binding var fillColor: Color
    @State var isAnimating = false
    
    var body: some View {
        GeometryReader{ proxy in
            
            let size = proxy.size
            
            ZStack{
                Image("WaterGlass")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("LightGray"))
                
                WaterWave(progress: progress, waveHeight: 0.02, offset: startAnimation)
                    .fill(fillColor)
                    .mask{
                        Image("WaterGlass")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color("LightGray"))
                    }.onAppear{
                        //animation loop
                        DispatchQueue.main.async{
                            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                            startAnimation = size.width+100
                        }
                        }
                    }
            } 
        }
    }
}

struct WaterWave: Shape {
    var progress: CGFloat
    var waveHeight: CGFloat
    //inital animation start
    var offset: CGFloat
    
    //enabling animation
    var animatableData: CGFloat{
        get{offset}
        set{offset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        return Path{path in
        
            path.move(to: .zero)
        
            let progressHeight: CGFloat = (1-progress) * rect.height
            let height = waveHeight * rect.height
            
            for value in stride(from: 0, to: rect.width, by: 2){
                
                let x: CGFloat = value
                let sine: CGFloat = sin(Angle(degrees: value + offset).radians)
                let y: CGFloat = progressHeight + (height * sine)
                
                path.addLine(to: CGPoint(x: x, y: y))
            }
            
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}
