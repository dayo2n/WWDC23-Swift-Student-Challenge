//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct Gauge: View {
    
    @Binding var value: Double
    
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule()
                .frame(width: 600, height: 50)
                .foregroundColor(.light)
            
            Capsule()
                .frame(width: value * 600 , height: 50)
                .foregroundColor(.keyColor)
        }
    }
}
