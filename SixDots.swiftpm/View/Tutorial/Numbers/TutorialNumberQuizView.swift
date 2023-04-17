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
    @State private var showHint: Bool = false
    
    @State private var hintCells: [[Bool]] = [Braille.BRAILLE_NUMBERS[0].cells,
                                              Braille.BRAILLE_NUMBERS[1].cells,
                                              Braille.BRAILLE_NUMBERS[2].cells,
                                              Braille.BRAILLE_NUMBERS[3].cells,
                                              Braille.BRAILLE_NUMBERS[4].cells,
                                              Braille.BRAILLE_NUMBERS[5].cells,
                                              Braille.BRAILLE_NUMBERS[6].cells,
                                              Braille.BRAILLE_NUMBERS[7].cells,
                                              Braille.BRAILLE_NUMBERS[8].cells,
                                              Braille.BRAILLE_NUMBERS[9].cells]
     
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
                    BrailleView(statusOfCells: answer_left[0], cellSize: 40)
                    BrailleView(statusOfCells: answer_left[1], cellSize: 40)
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
                    BrailleView(statusOfCells: answer_right[0], cellSize: 40)
                    BrailleView(statusOfCells: answer_right[1], cellSize: 40)
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
        .navigationBarItems(trailing: Button(action: { 
            showHint = true 
        }, label: {
            Text("Hint")
                .padding()
        }))
        .sheet(isPresented: $showHint) {
            VStack(alignment: .center, spacing: 30) {
                HStack(spacing: 10) {
                    ForEach(0..<5) { index in
                        VStack(spacing: 10) {
                            Text("\(index + 1)")
                                .font(.sandoll(size: 30, weight: .regular))
                            BrailleView(statusOfCells: hintCells[index], cellSize: 30)
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
                    ForEach(0..<5) { index in
                        VStack(spacing: 10) {
                            Text("\((index + 1 + 5))")
                                .font(.sandoll(size: 30, weight: .regular))
                            BrailleView(statusOfCells: hintCells[index + 5], cellSize: 30)
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
                    showHint = false
                }, label: {
                    Text("Dismiss")
                        .font(.sandoll(size: 20, weight: .regular))
                        .padding(30)
                })
            }
        }
    }
}

struct TutorialNumberQuizView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialNumberQuizView()
    }
}
