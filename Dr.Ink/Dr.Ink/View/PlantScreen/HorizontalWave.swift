//
//  HorizontalWave.swift
//  Dr.Ink
//
//  Created by Ebbyy on 2022/05/04.
//

import SwiftUI

struct HorizontalWave: View {
    
    @State var progress: CGFloat = 0.0
    @Binding var startAnimation: CGFloat
    @State var isAnimating = false
    
    
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size
            
            ZStack{
                wave(progress: progress, waveHeight: 0.02, offset: startAnimation)
                    .fill(Color("LightLightBlue"))
                    .mask{
                        Rectangle()
                            .frame(width: 59, height: 293)
                            .cornerRadius(15)
                            .shadow(color: .gray, radius: 3, x: 1, y: 3)
                    }.onAppear{
                        //animation loop
                        DispatchQueue.main.async{
                            withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                                startAnimation = size.height+100
                            }
                        }
                    }
            }.rotationEffect(.degrees(90))
        }
    }
}

struct HorizontalWave_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalWave(startAnimation: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}

struct wave: Shape {
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

extension HorizontalWave{

}
