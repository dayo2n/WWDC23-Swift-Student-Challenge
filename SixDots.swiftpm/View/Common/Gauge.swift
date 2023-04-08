//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct Gauge: View {
    
    @State var value: Double = 18 / 100 * 600
    var body: some View {
        ZStack (alignment: .leading) {
            Capsule()
                .frame(width: 600, height: 64)
                .foregroundColor(.light)
            
            Capsule()
                .frame(width: value, height: 64)
                .foregroundColor(.keyColor)
        }
    }
}

struct Gauge_Previews: PreviewProvider {
    static var previews: some View {
        Gauge()
    }
}
