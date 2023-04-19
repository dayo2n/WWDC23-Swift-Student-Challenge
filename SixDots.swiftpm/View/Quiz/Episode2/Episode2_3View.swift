//
//  Episode2_3View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode2_3View: View {
    @Environment(\.dismiss) private var dismiss
    private let textContent = ["Ah, there it is.",
                               "Thank you for making braille.",
                               "Braille before 1 is a **number sign**.",
                               "Doesn't it look like a flipped L?🤣",
                               "\n**Anyway, I hope every button on the other floor has braille...🥺**"]
    @State private var isCellPressed = [false, false, true, true, true, true]
    @State private var textOpacities = Array(repeating: 0.0, count: 5)
    @State private var cellOpacity = 0.0
    @State private var imagePadding = CGFloat(0)
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(IMAGE_FloorButtonWithBraille)")
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, imagePadding)
                    .padding(.bottom, geo.size.height * 0.4)
                    .grayscale(0.5)
                
                HStack (spacing: 30) {
                    VStack (spacing: 25) {
                        ForEach (0..<3) { cell in
                            CellView(isTapped: $isCellPressed[cell], cellSize: min(geo.size.width, geo.size.height) * 0.12)
                        }
                    }
                    VStack (spacing: 25) {
                        ForEach (0..<3) { cell in
                            CellView(isTapped: $isCellPressed[cell + 3], cellSize: min(geo.size.width, geo.size.height) * 0.12)
                        }
                    }
                }
                .padding(30)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.light)
                        .opacity(0.7)
                }
                .padding(.bottom, geo.size.height * 0.4)
                .opacity(cellOpacity)
                .padding(.leading, imagePadding)
                
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                // TODO: foreach문 처리 (일단 개행, 볼드때문에 적용 X)
                                Text("Thank you for making braille.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpacities[1])
                                    .onAppear {
                                        textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                        withAnimation(.easeIn.delay(1)) {
                                            self.textOpacities[1] = 1.0
                                        }
                                    }
                                Text("Braille on the left side of Braile 1 is a **numeric symbol**.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpacities[2])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(2)) {
                                            self.textOpacities[2] = 1.0
                                            self.cellOpacity = 1.0
                                            self.imagePadding = geo.size.width * 0.2
                                        }
                                    }
                                Text("Doesn't it look like a flipped L?🤣")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpacities[3])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(3)) {
                                            self.textOpacities[3] = 1.0
                                        }
                                    }
                                Text("\n**Anyway, I hope every button on the other floor has braille...🥺**")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(self.textOpacities[4])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(4)) {
                                            self.textOpacities[4] = 1.0
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
                                
                                NavigationLink {
                                    Episode3_1View()
                                } label: {
                                    NextButtonView(fontSize: textSize)
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
            Image("\(IMAGE_InsideElevator)")
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
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
        }))
    }
}

struct Episode2_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_3View()
    }
}
