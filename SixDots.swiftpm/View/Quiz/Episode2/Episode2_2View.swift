//
//  Episode2_2View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode2_2View: View {
    @State private var isCellPressed = Array(repeating: false, count: 6)
    @State private var numberOfClickNext = 0
    @State private var showResult = false
    var body: some View {
        ZStack {
            
            Image("\(IMAGE_FloorButton)")
                .resizable()
                .scaledToFit()
                .padding(numberOfClickNext > 0 ? .trailing : .horizontal, 200)
                .padding(.bottom, 500)
            
            if numberOfClickNext > 0 {
                HStack (spacing: 30) {
                    VStack (spacing: 25) {
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
                .padding(30)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.light)
                        .opacity(0.7)
                }
                .padding(.leading, 250)
                .padding(.bottom, 500)
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(numberOfClickNext > 0 ? "You can mark the six dots on the screen.\nPress the NEXT button when you're done!" : "Hmm... Well, I've got a new snag.\nThere's no braille on the elevator button.\nCan you make a number Braille on the button on the **first floor** I'm going to?")
                            .font(.sandoll(size: 35, weight: .regular))
                            .lineSpacing(10)
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                numberOfClickNext += 1
                                if numberOfClickNext > 2 {
                                    showResult = true
                                }
                            } label: {
                                NextButtonView()
                            }
                            .padding(20)
                        }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 500)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.light.opacity(0.9))
                        
                }
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 40)
        }
        .background {
            Image("\(IMAGE_InsideElevator)")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
        }
        .alert(isCellPressed == Braille.BRAILLE_NUMBERS[0].cells ? "That's right!🥳" : "Do it Again🤓", isPresented: $showResult) {
            Button("Next", role: .cancel) {

            }
        }
        .ignoresSafeArea()
    }
}

struct Episode2_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_2View()
    }
}
