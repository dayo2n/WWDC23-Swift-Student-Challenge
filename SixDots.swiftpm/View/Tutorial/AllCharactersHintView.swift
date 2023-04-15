//
//  AllCharactersHintView.swift
//  
//
//  Created by 제나 on 2023/04/13.
//

import SwiftUI

struct AllCharactersHintView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                ForEach(0..<10) { index in
                    VStack(spacing: 10) {
                        Text("\(index + 1)")
                            .font(.sandoll(size: 30, weight: .regular))
                        BrailleView(statusOfCells: Braille.BRAILLE_NUMBERS[index].cells, cellSize: 20)
                    }
                    .padding(10)
                    .background {
                        Rectangle()
                            .foregroundColor(Color.light)
                            .opacity(0.2)
                            .cornerRadius(20)
                        }
                }
            }
            
            ForEach(0..<Int(Braille.BRAILLE_ALPHABETS.count/10)) { row in
                HStack(spacing: 10) {
                    ForEach(0..<10) { index in
                        VStack(spacing: 10) {
                            Text("\(Braille.BRAILLE_ALPHABETS[index + 10 * row].keyword)")
                                .font(.sandoll(size: 30, weight: .regular))
                            BrailleView(statusOfCells: Braille.BRAILLE_ALPHABETS[index + 10 * row].cells, cellSize: 20)
                        }
                        .padding(10)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.light)
                                .opacity(0.2)
                        }
                    }
                }
            }
            
            HStack(spacing: 10) {
                ForEach(0..<Braille.BRAILLE_ALPHABETS.count % 10) { index in
                    VStack(spacing: 10) {
                        Text("\(Braille.BRAILLE_ALPHABETS[(Braille.BRAILLE_ALPHABETS.count / 10) * 10 + index].keyword)")
                            .font(.sandoll(size: 30, weight: .regular))
                        BrailleView(statusOfCells: Braille.BRAILLE_ALPHABETS[(Braille.BRAILLE_ALPHABETS.count / 10) * 10 + index].cells, cellSize: 20)
                    }
                    .padding(10)
                    .background {
                        Rectangle()
                            .foregroundColor(Color.light)
                            .opacity(0.2)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

struct AllCharactersHintView_Previews: PreviewProvider {
    static var previews: some View {
        AllCharactersHintView()
    }
}
