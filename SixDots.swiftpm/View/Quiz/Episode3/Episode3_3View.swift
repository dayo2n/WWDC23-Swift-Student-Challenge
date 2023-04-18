//
//  Episode3_3View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_3View: View {
    @State private var isStopBlock = Array(repeating: false, count: 5)
    @State private var showResult = false
    @State private var navigateToNextView = false
    @State private var showHint = false
    @State private var textOpacities = Array(repeating: 0.0, count: 3)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            
            NavigationLink(destination: Episode3_4View(), isActive: $navigateToNextView) {
                EmptyView()
            }
            ZStack {
                Image("\(IMAGE_Crosswalk)")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 550)
                
                VStack {
                    HStack {
                        ForEach(0..<5) { index in
                            Image("\(isStopBlock[index] ? IMAGE_StopBlock : IMAGE_GuidanceBlock)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .onTapGesture {
                                    isStopBlock[index].toggle()
                                    if !isStopBlock.contains(false) {
                                        showResult = true
                                    }
                                }
                        }
                    }
                    Image("\(IMAGE_GuidanceBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                    Image("\(IMAGE_GuidanceBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }
            }
            
            ZStack {
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("There are incorrectly installed tactile paving blocks")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacities[0])
                                .onAppear {
                                    withAnimation(.easeIn.delay(0)) {
                                        textOpacities[0] = 1.0
                                    }
                                }
                            Text("**In front of the crosswalk, there should be warning blocks that means stop and be careful.**")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacities[1])
                                .onAppear {
                                    withAnimation(.easeIn.delay(1)) {
                                        textOpacities[1] = 1.0
                                    }
                                }
                            Text("Please change the wrong blocks!")
                                .font(.sandoll(size: 35, weight: .medium))
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
                    .padding(.horizontal, 15)
                    .frame(height: 500)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light.opacity(0.9))
                            
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            PrevButtonView()
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 40)
        }
        .background {
            Image("\(IMAGE_NoBraileSideWalkOnStreet0)")
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
        }
        .ignoresSafeArea()
        .alert("Exactly! That's it!🥳", isPresented: $showResult) {
            Button("Next", role: .cancel) {
                self.navigateToNextView = true
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
        .alert("Tap the yellow Braille block to change the surface.", isPresented: $showHint) {
            Button("Okay", role: .cancel) { }
        }
    }
}

struct Episode3_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_3View()
    }
}
