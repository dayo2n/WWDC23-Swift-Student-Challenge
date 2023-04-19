//
//  Episode2_2View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode2_2View: View {
    @State private var isCellPressed = Array(repeating: false, count: 6)
    @State private var showResult = false
    @State private var navigateToNextView = false
    @State private var showHint = false
    @State private var textOpcities = Array(repeating: 0.0, count: 3)
    @State private var contentsOpacity = 0.0
    @State private var cellOpacity = 0.0
    @State private var backgroundBlurRadius = 0
    @State private var textSize = CGFloat(20)
    @State private var imagePadding = CGFloat(0)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationLink(destination: Episode2_3View(), isActive: $navigateToNextView) {
                    EmptyView()
                }
                Image("\(IMAGE_FloorButton)")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, imagePadding)
                    .padding(.bottom, geo.size.height * 0.4)
                    .grayscale(0.5)

                    HStack (spacing: 30) {
                        VStack (spacing: 25) {
                            ForEach (0..<3) { cell in
                                CellView(isTapped: $isCellPressed[cell], cellSize: min(geo.size.width, geo.size.height) * 0.12)
                                    .onTapGesture {
                                        isCellPressed[cell].toggle()
                                        if isCellPressed == Braille.BRAILLE_NUMBERS[0].cells {
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
                                        if isCellPressed == Braille.BRAILLE_NUMBERS[0].cells {
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
                    .padding(.leading, imagePadding)
                    .padding(.bottom, geo.size.height * 0.4)
                    .opacity(cellOpacity)
                
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Hmm... Well, I've got a new snag..")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpcities[0])
                                    .onAppear {
                                        textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                        withAnimation(.easeIn.delay(2)) {
                                            self.textOpcities[0] = 1.0
                                        }
                                    }
                                Text("There's no braille on the elevator button.")
                                    .font(.sandoll(size: textSize * 1.2, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpcities[1])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(3)) {
                                            self.textOpcities[1] = 1.0
                                        }
                                    }
                                Text("So can you make a number braille on the **first floor** button?")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpcities[2])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(3)) {
                                            self.textOpcities[2] = 1.0
                                            cellOpacity = 1.0
                                            imagePadding = geo.size.width * 0.3
                                        }
                                    }
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Button {
                                    dismiss()
                                } label: {
                                    PrevButtonView(fontSize: textSize)
                                }
                                Spacer()
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
        .opacity(contentsOpacity)
        .onAppear {
            withAnimation(.easeIn(duration: 1).delay(1)) {
                contentsOpacity = 1.0
                backgroundBlurRadius = 15
            }
        }
        .background {
            Image("\(IMAGE_InsideElevator)")
                .resizable()
                .scaledToFill()
                .blur(radius: CGFloat(backgroundBlurRadius))
        }
        .alert("That's right!🥳", isPresented: $showResult) {
            Button("Next", role: .cancel) {
                self.navigateToNextView = true
            }
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
            .opacity(contentsOpacity)
        }), trailing: Button(action: {
            showHint = true
        }, label: {
            Text("Hint")
                .font(.sandoll(size: textSize, weight: .semibold))
                .opacity(contentsOpacity)
        }))
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
    }
}

struct Episode2_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_2View()
    }
}
