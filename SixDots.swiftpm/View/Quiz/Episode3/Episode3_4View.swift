//
//  Episode3_4View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_4View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var textOpacities = Array(repeating: 0.0, count: 2)
    @State private var textSize: CGFloat = 20
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack(spacing: 50) {
                    VStack {
                        Image("\(IMAGE_GuidanceBlock)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geo.size.width, geo.size.height) * 0.4)
                            .padding(.bottom, 20)
                        
                        Text("Straight")
                            .font(.sandoll(size: textSize * 1.2, weight: .bold))
                            .foregroundColor(Color.dark)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.light)
                                    .opacity(0.3)
                            }
                    }
                    VStack {
                        Image("\(IMAGE_StopBlock)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: min(geo.size.width, geo.size.height) * 0.4)
                            .padding(.bottom, 20)
                        
                        Text("Stop")
                            .font(.sandoll(size: textSize * 1.2, weight: .bold))
                            .foregroundColor(Color.dark)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.light)
                                    .opacity(0.3)
                            }
                    }
                }
                .padding(.bottom, geo.size.height * 0.45)
                
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            VStack (alignment: .leading, spacing: 30) {
                                Text("The block on the left is a braille **guiding block** that says you can **go straight.**")
                                    .font(.sandoll(size: CGFloat(textSize), weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(textOpacities[0])
                                    .onAppear {
                                        textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                        withAnimation(.easeIn.delay(0)) {
                                            textOpacities[0] = 1.0
                                        }
                                    }
                                Text("The block on the right is a braille **stop block** used to stop temporarily, usually at **crosswalks** or when **there is a sudden change** in the direction of the road.")
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
                                    Episode4_1View()
                                } label: {
                                    NextButtonView(fontSize: textSize)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, textSize)
                    .frame(height: geo.size.height * 0.4)
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
            Image("\( IMAGE_NoBraileSideWalkOnStreet0)")
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
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: textSize, weight: .semibold))
                    .foregroundColor(Color.dark)
            }
        }))
    }
}

struct Episode3_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_4View()
    }
}
