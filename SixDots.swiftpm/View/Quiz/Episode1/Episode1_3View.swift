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
    @State private var buttonWidth = 240
    @State private var buttonHeight = 80
    @State private var textOpacities = Array(repeating: 0.0, count: 3)
    
    var body: some View {
        ZStack {
            NavigationLink(destination: Episode1_4View(), isActive: $activateNavigationToNextView) {
                EmptyView()
            }
            
            Image("\(IMAGE_DownButtonWithWrongBraille)")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .padding(.bottom, 500)
            
            GeometryReader { geo in
                VStack {
                    Spacer()
                    ZStack {
                        VStack(alignment: .center, spacing: 20) {
                            HStack {
                                VStack(alignment: .leading, spacing: 20) {
                                    Text("The Braile on button is weird.")
                                        .font(.sandoll(size: 35, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(textOpacities[0])
                                        .onAppear {
                                            withAnimation(.easeIn) {
                                                textOpacities[0] = 1.0
                                            }
                                        }
                                    Text("**Which button has a weird braille mark? Up or down?**")
                                        .font(.sandoll(size: 35, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(textOpacities[1])
                                        .onAppear {
                                            withAnimation(.easeIn.delay(1)) {
                                                textOpacities[1] = 1.0
                                            }
                                        }
                                    Text("\nBraille would be unfamiliar to you, right?\n**Then press the hint button on the top right!**")
                                        .font(.sandoll(size: 25, weight: .medium))
                                        .foregroundColor(Color.dark)
                                        .lineSpacing(10)
                                        .opacity(textOpacities[2])
                                        .onAppear {
                                            withAnimation(.easeIn.delay(2)) {
                                                textOpacities[2] = 1.0
                                            }
                                        }
                                }
                                Spacer()
                            }
                            Spacer()
                            HStack(spacing: 50) {
                                Spacer()
                                Button {
                                   clickedUpButton = true
                                } label: {
                                    Text("UP")
                                        .font(.sandoll(size: 35, weight: .semibold))
                                        .foregroundColor(Color.dark)
                                        .padding(.vertical, 30)
                                        .frame(width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
                                        .background(clickedUpButton ? Color.keyColor.opacity(0.8) : Color.dark.opacity(0.2))
                                        .cornerRadius(20)
                                        .onAppear {
                                            withAnimation(Animation.linear(duration: 0.9).repeatForever()) {
                                                buttonWidth = 250
                                                buttonHeight = 90
                                            }
                                        }
                                }
                                Button {
                                   clickedDownButton = true
                                } label: {
                                    Text("DOWN")
                                        .font(.sandoll(size: 35, weight: .semibold))
                                        .foregroundColor(Color.dark)
                                        .padding(.vertical, 30)
                                        .frame(width: CGFloat(buttonWidth), height: CGFloat(buttonHeight))
                                        .background(clickedDownButton ?  Color.keyColor.opacity(0.8) :  Color.dark.opacity(0.2))
                                        .cornerRadius(20)
                                }
                                Spacer()
                            }
                        }
                        .padding(.vertical, 40)
                    }
                    .frame(width: geo.size.width - 30, height: 500)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light.opacity(0.9))
                    }
                }
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 40)
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
                    .font(.sandoll(size: 20, weight: .semibold))
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: 20, weight: .semibold))
                    .foregroundColor(Color.dark)
            }
            .padding()
        }), trailing: Button(action: {
            showHint = true
        }, label: {
            Text("Hint")
                .font(.sandoll(size: 20, weight: .semibold))
                .foregroundColor(Color.dark)
                .padding()
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
                        Text("Image credits Kosuke Takahashi.")
                            .font(.sandoll(size: 15, weight: .regular))
                            .padding([.bottom, .trailing], 20)
                    }
                    Button {
                        showHint = false
                    } label: {
                        Text("Dismiss")
                            .font(.sandoll(size: 20, weight: .semibold))
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
