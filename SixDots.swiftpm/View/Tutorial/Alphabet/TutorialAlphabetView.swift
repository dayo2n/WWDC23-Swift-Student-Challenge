//
//  TutorialAlphabetView.swift
//  
//
//  Created by 제나 on 2023/04/09.
//

import SwiftUI

struct TutorialAlphabetView: View {
    @State private var learningItem: LearningItem = LearningItem(learningMode: .alphabet)
    @State private var currentLevel: Int = 0
    @State private var currentProgressValue: Double = 0.03
    
    @State private var turnOnShowLearningView: Bool = true 
    @State private var showLearningView: Bool = true
    @State private var isCellPressed: [Bool] = Array(repeating: false, count: 6)
    @State private var correctResultCells: [Bool] = Array(repeating: false, count: 6)
    @State private var showResult: Bool = false
    @State private var isCorrectResult: Bool = false
    
    @State private var showNavigationAlert: Bool = false
    @State private var activateNavigationToQuizView: Bool = false
    
    private let learningTip: [String] = ["If you haven't studied numbers yet,\n go back and study numbers first!",
                                         "Did you notice something?",
                                         "Did you notice that there is a pattern?",
                                         "Did you notice that there is a pattern \nrelated to numbers?",
                                         "The lowercase letter a through j\nmatches the number 1 through 0.",
                                         "Then how do we distinguish numbers from a~j?",
                                         "Use the number symbol Braille,\nwhich looks like an inverted L",
                                         "You've probably seen number symbol Braille\nin the final quizof the number tutorial.",
                                         "If you don't remember,\nyou'll have to try the numbers again!😂",
                                         "You finished one pattern up to j.",
                                         
                                         "You'll find the same pattern as the numbers from k to t",
                                         "What do you think?",
                                         "Did you notice something this time too?",
                                         "k~t is equal to the addition\nof the 4th cell from the dot form a~j.",
                                         "",
                                         "",
                                         "",
                                         "",
                                         "",
                                         "You learned the second pattern until t :)",
                                         
                                         "In the third pattern, the 6th cell is added.",
                                         "Although u to z belong to this pattern,\nit is important to note that w is an exception.",
                                         "Caution! If it's in alphabetical order,\nit'll be w... It's a loner, so I'll let you know at the end.\nThis is x this time:)",
                                         "This is y this time:)",
                                         "You're almost done!",
                                         "It's finally out!\nW is an alphabet that is added later,\nso the shape is special.",
    ]
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: TutorialAlphabetQuizView(),
                isActive: $activateNavigationToQuizView,
                label: {
                    EmptyView()
                })
            TurnOnShowLearningViewToggle(turnOnShowLearningView: $turnOnShowLearningView)
                .padding(30)
            
            Spacer()
            
            // gauge
            Gauge(value: $currentProgressValue)
            
            Text("\(learningItem.learningItems[currentLevel])")
                .font(.sandoll(size: 100, weight: .bold))
            
            HStack (spacing: 50) {
                VStack (spacing: 35) {
                    ForEach (0..<3) { cell in
                        CellView(isTapped: $isCellPressed[cell], cellSize: 100)
                            .onTapGesture {
                                isCellPressed[cell].toggle()
                            }
                    }
                }
                
                VStack (spacing: 35) {
                    ForEach (0..<3) { cell in
                        CellView(isTapped: $isCellPressed[cell + 3], cellSize: 100)
                            .onTapGesture {
                                isCellPressed[cell+3].toggle()
                            }
                    }
                }
            }
            .padding(.bottom, 60)
            
            Button {
                isCorrectResult = isCellPressed == Braille.BRAILLE_ALPHABETS[currentLevel].cells
                showResult = true
            } label: {
                CheckButton()
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            correctResultCells = Braille.BRAILLE_ALPHABETS[currentLevel].cells
        }
        .sheet(isPresented: $showLearningView) {
            VStack(spacing: 20) {
                Text("This is")
                    .font(.sandoll(size: 30, weight: .bold))
                
                Text("\(learningItem.learningItems[currentLevel])")
                    .font(.sandoll(size: 50, weight: .bold))
                
                
                Text("\(learningTip[currentLevel])")
                    .font(.sandoll(size: 20, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                HStack (spacing: 50) {
                    VStack (spacing: 35) {
                        ForEach (0..<3) { cell in
                            CellView(isTapped: $correctResultCells[cell], cellSize: 70)
                        }
                    }
                    
                    VStack (spacing: 35) {
                        ForEach (0..<3) { cell in
                            CellView(isTapped: $correctResultCells[cell+3], cellSize: 70)
                        }
                    }
                }
                
                Button(action: {
                    showLearningView = false
                }, label: {
                    Text("Dismiss")
                        .font(.sandoll(size: 20, weight: .regular))
                        .padding(30)
                })
            }
        }
        .animation(.spring())
        .alert(isCorrectResult ? "Great!🥳" : "Do it again🤓", isPresented: $showResult) {
            Button(isCorrectResult ? "Next" : "Again", role: .cancel) {
                isCellPressed = Array(repeating: false, count: 6)
                
                if isCorrectResult {
                    if currentLevel == learningItem.learningItems.count - 1 {
                        showNavigationAlert = true
                    } else if currentLevel < learningItem.learningItems.count - 1 {
                        currentLevel += 1
                        correctResultCells = Braille.BRAILLE_ALPHABETS[currentLevel].cells
                        showLearningView = turnOnShowLearningView
                        currentProgressValue = Double(currentLevel + 1) / Double(learningItem.learningItems.count)
                    }
                }
            }
        }
        .alert(isPresented: $showNavigationAlert) {
            Alert(title: Text("You did it!😆"), message: Text("Let's check your Braille"), dismissButton: .default(Text("Okay"), action: {
                self.navigateToQuizView()
            }))
        }
        .navigationBarItems(trailing: Button(action: { showLearningView = true }, label: {
            Text("Hint")
                .padding()
        }))
    }
    
    private func navigateToQuizView() {
        DispatchQueue.main.async {
            self.activateNavigationToQuizView = true
        }
    }
}



struct TutorialAlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialAlphabetView()
    }
}
