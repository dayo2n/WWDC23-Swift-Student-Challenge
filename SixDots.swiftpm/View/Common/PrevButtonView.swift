//
//  PrevButtonView.swift
//  
//
//  Created by 제나 on 2023/04/18.
//

import SwiftUI

struct PrevButtonView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrowtriangle.backward.fill")
                .font(.sandoll(size: 40, weight: .regular))
                .foregroundColor(Color.keyColor)
            
            Text("PREV")
                .font(.sandoll(size: 40, weight: .bold))
                .foregroundColor(Color.keyColor)
        }
        .padding(20)
    }
}

struct PrevButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrevButtonView()
    }
}
