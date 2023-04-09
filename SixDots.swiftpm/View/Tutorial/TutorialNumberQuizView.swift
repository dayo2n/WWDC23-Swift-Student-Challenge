//
//  TutorialNumberQuizView.swift
//
//
//  Created by 제나 on 2023/04/08.
//

import SwiftUI

struct TutorialNumberQuizView: View {
    
    @State private var answer_left: [[Bool]] = [Braille.BRAILLE_NUMBERS[0].cells, Braille.BRAILLE_NUMBERS[9].cells]
    @State private var answer_right: [[Bool]] = [Braille.BRAILLE_NUMBERS[0].cells, Braille.BRAILLE_NUMBERS[7].cells]
    @State private var isLeftAnswerSelected: Bool = true
    
    @State private var showResult: Bool = false
     
    var body: some View {
        VStack(spacing: 30) {
            Text("Now, can you read the number\nof floors in the elevator in Braille?😉")
                .font(.sandoll(size: 36, weight: .bold))
                .multilineTextAlignment(.center)

            Image("elevatorFloorQuizQuestion")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .background {
                    Rectangle()
                        .foregroundColor(Color.light)
                        .frame(width: 400, height: 300)
                }
            
            HStack(spacing: 20) {
                HStack(spacing: 40) {
                    BrailleView(statusOfCells: $answer_left[0], cellSize: 40)
                    BrailleView(statusOfCells: $answer_left[1], cellSize: 40)
                }
                .padding(30)
                .background {
                    Rectangle()
                        .foregroundColor(Color.keyColor)
                        .opacity(0.3)
                        .cornerRadius(40)
                }
                .grayscale(isLeftAnswerSelected ? 0.0 : 1.0)
                .onTapGesture {
                    isLeftAnswerSelected = true
                }
                
                HStack(spacing: 40) {
                    BrailleView(statusOfCells: $answer_right[0], cellSize: 40)
                    BrailleView(statusOfCells: $answer_right[1], cellSize: 40)
                }
                .padding(30)
                .background {
                    Rectangle()
                        .foregroundColor(Color.keyColor)
                        .opacity(0.2)
                        .cornerRadius(40)
                }
                .grayscale(isLeftAnswerSelected ? 1.0 : 0.0)
                .onTapGesture {
                    isLeftAnswerSelected = false
                }
            }
            .padding(.bottom, 30)
            
            Button {
                showResult = true
            } label: {
                CheckButton()
            }
            .padding(.bottom, 30)
        }
        .animation(.spring())
        .alert(isPresented: $showResult) {
            Alert(title: Text(isLeftAnswerSelected ? "Congrats!😆" : "Do it again🥹"), message: Text("blah blah"), dismissButton: .default(Text("Okay"), action: { 
            }))
        }
    }
}

struct TutorialNumberQuizView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialNumberQuizView()
    }
}
