//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct CheckButton: View {
    
    @State private var isActive: Bool = true
    
    var body: some View {
        Text("Check")
            .font(.sandoll(size: 48, weight: .semibold))
            .foregroundColor(isActive ? Color.dark : Color.light)
            .background {
                Rectangle()
                    .foregroundColor(isActive ? Color.keyColor : Color.light)
                    .frame(width: 220, height: 100)
                    .cornerRadius(40)
                    .opacity(isActive ? 0.8 : 0.5)
            }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton()
    }
}
