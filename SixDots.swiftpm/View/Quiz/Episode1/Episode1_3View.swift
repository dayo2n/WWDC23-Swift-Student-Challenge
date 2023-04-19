//
//  Episode1_3View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_3View: View {
    
    @State private var clickedUpButton = false
    @State private var clickedDownButton = false
    @State private var activateNavigationToNextView = false
    @State private var showHint = false
    @State private var buttonWidth = 50
    @State private var buttonHeight = 50
    @State private var contentsOpacities = Array(repeating: 0.0, count: 4)
    @State private var textSize = CGFloat(20)
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                NavigationLink(destination: Episode1_4View(), isActive: $activateNavigationToNextView) {
                    EmptyView()
                }
                Image("\(IMAGE_DownButtonWithWrongBraille)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.6)
                    .padding(.bottom, geo.size.height * 0.4)
                
                VStack {
                    Spacer()
                    ZStack {
                        VStack(alignment: .center) {
                            Spacer()
                            HStack {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("The Braile on button is weird.")
                                        .font(.sandoll(size: textSize, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(contentsOpacities[0])
                                        .onAppear {
                                            textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                            withAnimation(.easeIn) {
                                                contentsOpacities[0] = 1.0
                                            }
                                        }
                                    Text("**Which button has a weird braille mark? Up or down?**")
                                        .font(.sandoll(size: textSize, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(contentsOpacities[1])
                                        .onAppear {
                                            withAnimation(.easeIn.delay(1)) {
                                                contentsOpacities[1] = 1.0
                                            }
                                        }
                                    Text("\nBraille would be unfamiliar to you, right?\n**Then press the hint button on the top right!**")
                                        .font(.sandoll(size: textSize * 0.8, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(contentsOpacities[2])
                                        .onAppear {
                                            withAnimation(.easeIn.delay(2)) {
                                                contentsOpacities[2] = 1.0
                                            }
                                        }
                                }
                                Spacer()
                            }
                            Spacer()
                            HStack(spacing: geo.size.width * 0.1) {
                                Spacer()
                                Button {
                                    clickedUpButton = true
                                } label: {
                                    Text("UP")
                                        .font(.sandoll(size: textSize * 1.2, weight: .semibold))
                                        .foregroundColor(Color.dark)
                                        .padding(.vertical, 30)
                                        .frame(width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
                                        .background(clickedUpButton ? Color.keyColor.opacity(0.8) : Color.dark.opacity(0.2))
                                        .cornerRadius(20)
                                        .onAppear {
                                            withAnimation(Animation.linear(duration: 0.9).repeatForever()) {
                                                buttonWidth = Int(geo.size.width * 0.32) + 10
                                                buttonHeight = Int(geo.size.height * 0.07) + 10
                                            }
                                        }
                                }
                                Button {
                                    clickedDownButton = true
                                } label: {
                                    Text("DOWN")
                                        .font(.sandoll(size: textSize * 1.2, weight: .semibold))
                                        .foregroundColor(Color.dark)
                                        .padding(.vertical, 30)
                                        .frame(width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
                                        .background(clickedDownButton ?  Color.keyColor.opacity(0.8) :  Color.dark.opacity(0.2))
                                        .cornerRadius(20)
                                }
                                Spacer()
                            }
                            .opacity(contentsOpacities[3])
                            .onAppear {
                                buttonWidth = Int(geo.size.width * 0.32)
                                buttonHeight = Int(geo.size.height * 0.07)
                                withAnimation(.easeIn.delay(3)) {
                                    contentsOpacities[3] = 1.0
                                }
                            }
                            Spacer()
                        }
                        .padding(.vertical, textSize)
                    }
                    .frame(width: geo.size.width - textSize * 4, height: geo.size.height * 0.45)
                    .padding(.horizontal, textSize)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light.opacity(0.9))
                    }
                }
            }
            .padding(.bottom, textSize)
            .padding(.horizontal, textSize)
        }
        .background {
            Image("\(IMAGE_FrontElevator)")
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
        }
        .ignoresSafeArea()
        .alert("Do it again!🤓", isPresented: $clickedUpButton) {
            Button("Again", role: .cancel) {
            }
        } message: {
            Text("Think about what letters will be written and look for braille in the hints.")
        }
        .alert("Thanks for your help🤩", isPresented: $clickedDownButton) {
            Button("Next", role: .cancel) {
                self.activateNavigationToNextView = true
            }
        }
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
            Text("Hint")
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

struct Episode1_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_3View()
    }
}
