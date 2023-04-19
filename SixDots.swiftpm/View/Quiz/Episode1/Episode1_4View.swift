//
//  Episode1_4View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode1_4View: View {
    @State private var isRotating = 0.0
    @State private var isMoving = 0
    @State private var textOpacities = [0.0, 0.0]
    @State private var textSize = CGFloat(20)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(IMAGE_DownButtonWithWrongBraille)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.6)
                    .padding(.bottom, geo.size.height * 0.4)
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack (alignment: .leading, spacing: 20) {
                                Text("The elevator installer **rotated the UP button 180 degrees**, making it look like a DOWN button for visual purposes only.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(textOpacities[0])
                                    .onAppear {
                                        textSize = geo.size.width * 0.05
                                        withAnimation(.easeIn) {
                                            textOpacities[0] = 1.0
                                        }
                                    }
                                Text("As a result, visually impaired people like me cannot read the braille on this button.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(textOpacities[1])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(1)) {
                                            textOpacities[1] = 1.0
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
                                    Episode1_5View()
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
                
                VStack {
                    HStack {
                        Spacer()
                        Image("\(IMAGE_CroppedUpButton)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.3)
                            .rotationEffect(.degrees(isRotating))
                            .offset(x: geo.size.width * 0.3, y: CGFloat(isMoving))
                            .onAppear {
                                withAnimation(.linear(duration: 1.0).delay(1.5)) {
                                        isRotating = 185.0
                                    }
                                withAnimation(.linear(duration: 1.0).delay(2.7)) {
                                    isMoving = Int(geo.size.height / 3)
                                    }
                            }
                            .padding(30)
                        Spacer()
                    }
                    Spacer()
                }
            }
            .background {
                Image("\(IMAGE_FrontElevator)")
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
                        .foregroundColor(Color.dark)
                    Text("Home")
                        .font(.sandoll(size: textSize, weight: .semibold))
                        .foregroundColor(Color.dark)
                }
                .padding()
            }))
        }
    }
}

struct Episode1_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_4View()
    }
}
