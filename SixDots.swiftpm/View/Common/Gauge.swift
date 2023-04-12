//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct Gauge: View {
    
    @Binding var value: Double
    @State var size: GeometryProxy
    
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule()
                .frame(width: size.size.width * 0.8, height: 50)
                .foregroundColor(.light)
            
            Capsule()
                .frame(width: value * size.size.width * 0.8 , height: 50)
                .foregroundColor(.keyColor)
        }
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: 0.2)
    }
}
