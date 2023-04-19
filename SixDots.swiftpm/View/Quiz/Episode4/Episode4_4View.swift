//
//  Episode4_4View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_4View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(IMAGE_StopBellWithBraille)")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, geo.size.height * 0.45)
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text("Even locating the bus stop button by touch be difficult for people with visual impairments, but it becomes even more challenging if there is no braille.😭")
                                .font(.sandoll(size: textSize, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
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
                                    EndingView()
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
            .onAppear {
                textSize = geo.size.width * 0.05
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
            .padding()
        }))
    }
}

struct Episode4_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_4View()
    }
}
