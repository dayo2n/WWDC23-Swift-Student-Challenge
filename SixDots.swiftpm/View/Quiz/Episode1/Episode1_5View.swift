//
//  Episode1_5View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode1_5View: View {
    @State private var showHint = false
    @State private var textSize = CGFloat(20)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("\(IMAGE_DownButtonWithCorrectedBraille)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.6)
                    .padding(.bottom, geo.size.height * 0.4)
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text("The down button should be written in Braille as **‘down’** or abbreviated as **‘dwn’**.\nI changed the braille correctly. If you want to check it out, press the 'Braille' button on the top right!")
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
                                    Episode2_1View()
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
                textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
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
        }), trailing: Button(action: {
            showHint = true
        }, label: {
            Text("Braille")
                .font(.sandoll(size: textSize, weight: .semibold))
                .foregroundColor(Color.dark)
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
                            .font(.sandoll(size: textSize * 0.8, weight: .regular))
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

struct Episode1_5View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_5View()
    }
}
