//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct CellView: View {
    
    @Binding var isTapped: Bool
    var cellSize: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: cellSize, height: cellSize)
            .foregroundColor(isTapped ? Color.dark : Color.light)
            .overlay {
                Circle()
                    .stroke(isTapped ? Color.light : Color.dark, lineWidth: 3)
            }
            .shadow(radius: 5, x: 0, y: 5)
            .opacity(isTapped ? 1.0 : 0.8)
            .onAppear {
                print(isTapped)
            }
    }
}
