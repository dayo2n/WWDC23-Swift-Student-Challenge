//
//  NextButtonStyle.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct NextButtonView: View {
    var fontSize = CGFloat(30)
    var body: some View {
        HStack {
            Text("NEXT")
                .font(.sandoll(size: CGFloat(fontSize), weight: .bold))
                .foregroundColor(Color.keyColor)
            
            Image(systemName: "arrowtriangle.forward.fill")
                .font(.sandoll(size: CGFloat(fontSize), weight: .regular))
                .foregroundColor(Color.keyColor)
        }
        .padding(20)
    }
}
