//
//  NextButtonStyle.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct NextButtonView: View {
    var body: some View {
        HStack {
            Text("NEXT")
                .font(.sandoll(size: 40, weight: .bold))
                .foregroundColor(Color.keyColor)
            
            Image(systemName: "arrowtriangle.forward.fill")
                .font(.sandoll(size: 40, weight: .regular))
                .foregroundColor(Color.keyColor)
        }
    }
}
