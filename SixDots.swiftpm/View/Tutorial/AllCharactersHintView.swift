//
//  SwiftUIView.swift
//  
//
//  Created by 제나 on 2023/04/13.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 10) {
                ForEach(0..<10) { index in
                    VStack(spacing: 10) {
                        Text("\(index + 1)")
                            .font(.sandoll(size: 30, weight: .regular))
                        BrailleView(statusOfCells: Braille.BRAILLE_NUMBERS[index].cells, cellSize: 30)
                    }
                    .padding()
                    .background {
                        Rectangle()
                            .foregroundColor(Color.light)
                            .opacity(0.2)
                            .cornerRadius(20)
                        }
                }
            }
            
            HStack(spacing: 10) {
                ForEach(0..<10) { index in
                    VStack(spacing: 10) {
                        Text("\((index + 1 + 5) % 10)")
                            .font(.sandoll(size: 30, weight: .regular))
                        BrailleView(statusOfCells: Braille.BRAILLE_ALPHABETS[index].cells, cellSize: 30)
                    }
                    .padding()
                    .background {
                        Rectangle()
                            .foregroundColor(Color.light)
                            .opacity(0.2)
                            .cornerRadius(20)
                    }
                }
            }
            
            Button(action: {
                
            }, label: {
                Text("Dismiss")
                    .font(.sandoll(size: 20, weight: .regular))
                    .padding(30)
            })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
