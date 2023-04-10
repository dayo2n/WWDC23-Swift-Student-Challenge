//
//  TutorialNumberView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct TutorialNumberView: View {
    @State private var learningItem: LearningItem = LearningItem(learningMode: .number)
    @State private var currentLevel: Int = 0
    @State private var currentProgressValue: Double = 0.1
    
    @State private var turnOnShowLearningView: Bool = true
    @State private var showLearningView: Bool = true
    @State private var isCellPressed: [Bool] = Array(repeating: false, count: 6)
    @State private var correctResultCells: [Bool] = Array(repeating: false, count: 6)
    @State private var showResult: Bool = false
    @State private var isCorrectResult: Bool = false
    
    @State private var showNavigationAlert: Bool = false
    @State private var activateNavigationToQuizView: Bool = false
    
    var body: some View {
        VStack {
            NavigationLink(
                destination: TutorialNumberQuizView(),
                isActive: $activateNavigationToQuizView,
                label: {
                    EmptyView()
                })
            
            HStack {
                Spacer()
                
                Toggle("", isOn: $turnOnShowLearningView)
                    .padding(30)
            }
            
            // gauge
            Gauge(value: $currentProgressValue)
            
            Text("Let's do this!")
                .font(.sandoll(size: 44, weight: .bold))
            
            Text("\(learningItem.learningItems[currentLevel])")
                .font(.sandoll(size: 120, weight: .bold))
            
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
                isCorrectResult = isCellPressed == Braille.BRAILLE_NUMBERS[currentLevel].cells
                showResult = true
            } label: {
                CheckButton()
            }
            .padding(.bottom, 30)
        }
        .onAppear {
            correctResultCells = Braille.BRAILLE_NUMBERS[currentLevel].cells
        }
        .sheet(isPresented: $showLearningView) {
            VStack(spacing: 20) {
                Text("This is")
                    .font(.sandoll(size: 40, weight: .bold))
                
                Text("\(learningItem.learningItems[currentLevel])")
                    .font(.sandoll(size: 100, weight: .bold))
                
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
                        showNavigationAlert = showLearningView
                    } else if currentLevel < learningItem.learningItems.count - 1 {
                        currentLevel += 1
                        correctResultCells = Braille.BRAILLE_NUMBERS[currentLevel].cells
                        showLearningView = true
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

