//
//  Episode1_1View.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_1View: View {
    @State private var opacities = Array(repeating: 0.0, count: 4)
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack(spacing: 20) {
                            VStack(alignment: .leading, spacing: 20) {
                                Text("Hi, I'm XHENA!")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(opacities[0])
                                    .onAppear {
                                        textSize = geo.size.width * 0.05
                                        withAnimation(.easeIn) {
                                            self.opacities[0] = 1.0
                                        }
                                    }
                                Text("And I’m **visually impaired.**")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(opacities[1])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(1)) {
                                            self.opacities[1] = 1.0
                                        }
                                    }
                                Text("I went out today, and now I'm done with my business, I have to go back home alone.")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(opacities[2])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(2)) {
                                            self.opacities[2] = 1.0
                                        }
                                    }
                                Text("**Can you help me get home?**")
                                    .font(.sandoll(size: textSize, weight: .medium))
                                    .foregroundColor(Color.dark)
                                    .lineSpacing(10)
                                    .opacity(opacities[3])
                                    .onAppear {
                                        withAnimation(.easeIn.delay(3)) {
                                            self.opacities[3] = 1.0
                                        }
                                    }
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                NavigationLink {
                                    Episode1_2View()
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
            Image("\(IMAGE_XHENA1)")
                .resizable()
                .scaledToFit()
                .padding(.all, 50)
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
            .padding()
        }))
    }
}

struct Episode1_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_1View()
    }
}
