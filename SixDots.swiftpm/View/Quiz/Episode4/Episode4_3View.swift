//
//  Episode4_3View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_3View: View {
    
    @State private var numberOfClickNext = 0
    @State private var isCellPressed = Array(repeating: false, count: 6)
    @State private var showResult = false
    @State private var activateNavigationToNextView = false
    var body: some View {
        ZStack {
            
            NavigationLink(destination: Episode4_4View(), isActive: $activateNavigationToNextView) {
                EmptyView()
            }
            
            HStack {
                Image("\(IMAGE_StopBell)")
                
                if numberOfClickNext > 0 {
                    HStack (spacing: 35) {
                        VStack (spacing: 30) {
                            ForEach (0..<3) { cell in
                                CellView(isTapped: $isCellPressed[cell], cellSize: 100)
                                    .onTapGesture {
                                        isCellPressed[cell].toggle()
                                        if isCellPressed == Braille.BRAILLE_ALPHABETS[18].cells {
                                            showResult = true
                                        }
                                    }
                            }
                        }
                        
                        VStack (spacing: 35) {
                            ForEach (0..<3) { cell in
                                CellView(isTapped: $isCellPressed[cell + 3], cellSize: 100)
                                    .onTapGesture {
                                        isCellPressed[cell+3].toggle()
                                        if isCellPressed == Braille.BRAILLE_ALPHABETS[18].cells {
                                            showResult = true
                                        }
                                    }
                            }
                        }
                    }
                    .padding(40)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light)
                            .opacity(0.7)
                    }
                }
            }
            .padding(.bottom, 450)
            
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(numberOfClickNext > 0 ? "Would you engrave braille for me?\nJust need **S**, the first letter of STOP to know!" : "Where the hell is the stop button?\nNo matter how hard I look, there's no braille.")
                            .font(.sandoll(size: 35, weight: .regular))
                        
                        Text(numberOfClickNext > 0 ? "\n\nPlease engrave it in the braille on the screen!" : "")
                            .font(.sandoll(size: 25, weight: .regular))
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            if numberOfClickNext == 0 {
                                Button {
                                    numberOfClickNext += 1
                                } label: {
                                    NextButtonView()
                                }
                                .padding(20)
                            }
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
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                Text("Home")
            }
        }))
        .alert("You did it🥳", isPresented: $showResult) {
            Button("Next", role: .cancel) {
                self.activateNavigationToNextView = true
            }
        }
    }
}

struct Episode4_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_3View()
    }
}
