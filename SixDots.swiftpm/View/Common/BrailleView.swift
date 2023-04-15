//
//  BrailleView.swift
//  
//
//  Created by 제나 on 2023/04/08.
//

import SwiftUI

struct BrailleView: View {
    
    @State var statusOfCells: [Bool]
    var cellSize: CGFloat
    
    var body: some View {
        HStack (spacing: 10) {
            VStack (spacing: 15) {
                ForEach (0..<3) { cell in
                    CellView(isTapped: $statusOfCells[cell], cellSize: cellSize)
                }
            }
            
            VStack (spacing: 15) {
                ForEach (0..<3) { cell in
                    CellView(isTapped: $statusOfCells[cell + 3], cellSize: cellSize)
                }
            }
        }
    }
}
