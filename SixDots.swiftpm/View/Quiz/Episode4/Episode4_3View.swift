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
    @State private var showHint = false
    @State private var textOpacity = 0.0
    @State private var textSize = CGFloat(20)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationLink(destination: Episode4_4View(), isActive: $activateNavigationToNextView) {
                    EmptyView()
                }
                HStack {
                    Image("\(IMAGE_StopBell)")
                        .resizable()
                        .scaledToFit()
                    
                    if numberOfClickNext > 0 {
                        HStack (spacing: 25) {
                            VStack (spacing: 20) {
                                ForEach (0..<3) { cell in
                                    CellView(isTapped: $isCellPressed[cell], cellSize: min(geo.size.width, geo.size.height) * 0.12)
                                        .onTapGesture {
                                            isCellPressed[cell].toggle()
                                            if isCellPressed == Braille.BRAILLE_ALPHABETS[18].cells {
                                                showResult = true
                                            }
                                        }
                                }
                            }
                            VStack (spacing: 25) {
                                ForEach (0..<3) { cell in
                                    CellView(isTapped: $isCellPressed[cell + 3], cellSize: min(geo.size.width, geo.size.height) * 0.12)
                                        .onTapGesture {
                                            isCellPressed[cell+3].toggle()
                                            if isCellPressed == Braille.BRAILLE_ALPHABETS[18].cells {
                                                showResult = true
                                            }
                                        }
                                }
                            }
                        }
                        .padding(textSize)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(Color.light)
                                .opacity(0.7)
                        }
                        .padding(.trailing, textSize)
                    }
                }
                .padding(.bottom, geo.size.height * 0.45)
                
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text(numberOfClickNext > 0 ? "Can you emboss braille for me? I can recognize it with just the first letter **'s'** of STOP!" : "Where is the bus stop button?\nI can't feel the braille no matter how much I touch it.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(textOpacity)
                                    .onAppear {
                                        textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                        withAnimation(.easeIn) {
                                            textOpacity = 1.0
                                        }
                                    }
                                Text(numberOfClickNext > 0 ? "\nLet's make the braille **s**!\nAgain, you can press the button on the upper right to see the hint." : "")
                                    .font(.sandoll(size: textSize * 0.8, weight: .regular))
                                    .foregroundColor(Color.dark)
                                    .opacity(textOpacity)
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Button {
                                    if numberOfClickNext == 0 {
                                        dismiss()
                                    } else {
                                        numberOfClickNext -= 1
                                    }
                                } label: {
                                    PrevButtonView(fontSize: textSize)
                                }

                                Spacer()
                                
                                if numberOfClickNext == 0 {
                                    Button {
                                        numberOfClickNext += 1
                                    } label: {
                                        NextButtonView(fontSize: textSize)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, textSize)
                    .frame(height: geo.size.height * 0.45)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light.opacity(0.9))
                    }
                }
                .padding(.bottom, textSize)
                .padding(.horizontal, textSize)
            }
        }
        .background {
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
                .grayscale(0.7)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                    .font(.sandoll(size: textSize * 0.5, weight: .semibold))
                Text("Home")
                    .font(.sandoll(size: textSize, weight: .semibold))
            }
        }), trailing: Button(action: {
            showHint = true
        }, label: {
            if numberOfClickNext > 0 {
                Text("Hint")
                    .font(.sandoll(size: textSize, weight: .semibold))
                }
        }))
        .alert("You did it🥳🥳🥳", isPresented: $showResult) {
            Button("Next", role: .cancel) {
                self.activateNavigationToNextView = true
            }
        }
        .sheet(isPresented: $showHint) {
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Spacer()
                    Image("\(IMAGE_BrailleNeue_KosukeTakahashi)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    HStack {
                        Spacer()
                        Text("Image credits Kosuke Takahashi")
                            .font(.sandoll(size: textSize * 0.5, weight: .regular))
                            .padding([.bottom, .trailing], 20)
                    }
                    Button {
                        showHint = false
                    } label: {
                        Text("Dismiss")
                            .font(.sandoll(size: textSize, weight: .semibold))
                    }
                    Spacer()
                }
            }
        }
        .onChange(of: self.numberOfClickNext) { newValue in
            self.textOpacity = 0.0
            
            withAnimation(.easeIn) {
                self.textOpacity = 1.0
            }
        }
    }
}

struct Episode4_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_3View()
    }
}
