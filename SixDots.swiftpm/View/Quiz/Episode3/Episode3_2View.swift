//
//  Episode3_2View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_2View: View {
    @State private var numberOfClickNext = 0
    @State private var imageBANGSize = CGFloat(200)
    @State private var imageBANGSmallSize = CGFloat(200)
    @State private var textOpacity = 0.0
    @Environment(\.dismiss) private var dismiss
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in 
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text(numberOfClickNext == 0 ? "I can hear a passing car.. but since the tactile paving is a guidance surface, I can just keep going, right?" : "Oh my gosh!!\nSomeone honked their horn loudly to let me know that I was in danger.\nI think the tactile paving block might have been installed incorrectly.")
                                .font(.sandoll(size: textSize, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacity)
                                .onAppear {
                                    textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                    imageBANGSmallSize = geo.size.width * 0.8
                                    withAnimation(.easeIn) {
                                        textOpacity = 1.0
                                    }
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
                                } else {
                                    NavigationLink {
                                        Episode3_3View()
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
            ZStack {
                Color(hex: "D1C6B4")
                Image("\(numberOfClickNext == 0 ? IMAGE_NoBraileSideWalkOnStreet0 : IMAGE_NoBraileSideWalkOnStreet1)")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing, 100)
                if numberOfClickNext > 0 {
                    Image("\(IMAGE_Bang)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(imageBANGSize))
                        .padding([.trailing, .bottom], 180)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                imageBANGSize = UIScreen.main.bounds.width
                            }
                            withAnimation(.easeIn.delay(0.5)) {
                                imageBANGSize = imageBANGSmallSize
                            }
                        }
                }
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
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: textSize, weight: .semibold))
                    .foregroundColor(Color.dark)
            }
        }))
        .onChange(of: self.numberOfClickNext) { newValue in
            self.textOpacity = 0.0
            
            withAnimation(.easeIn) {
                self.textOpacity = 1.0
            }
            
            if newValue == 0 {
                imageBANGSize = 200
            }
        }
    }
}

struct Episode3_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_2View()
    }
}
