//
//  Episode3_4View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_4View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var textOpacities = Array(repeating: 0.0, count: 3)
    var body: some View {
        ZStack {
            HStack(spacing: 50) {
                VStack {
                    Image("\(IMAGE_GuidanceBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(.bottom, 20)
                    
                    Text("Straight")
                        .font(.sandoll(size: 50, weight: .bold))
                }
                
                VStack {
                    Image("\(IMAGE_StopBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .padding(.bottom, 20)
                    
                    Text("Stop")
                        .font(.sandoll(size: 50, weight: .bold))
                }
            }
            .padding(.bottom, 400)
            
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        VStack (alignment: .leading, spacing: 10) {
                            Text("The block on the left is the **guiding block** that says you can **go straight.**")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacities[0])
                                .onAppear {
                                    withAnimation(.easeIn.delay(0)) {
                                        textOpacities[0] = 1.0
                                    }
                                }
                            Text("\nThe block on the right is the **stop block** that tells you to stop.")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacities[1])
                                .onAppear {
                                    withAnimation(.easeIn.delay(1)) {
                                        textOpacities[1] = 1.0
                                    }
                                }
                            Text("It is usually used in front of the crosswalk or when the road is divided into several directions.")
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
                    
                    VStack {
                        Spacer()
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                PrevButtonView()
                            }

                            Spacer()
                            
                            NavigationLink {
                                Episode4_1View()
                            } label: {
                                NextButtonView()
                            }
                        }
                    }
                }
                .padding(.horizontal, 15)
                .frame(height: 500)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.light.opacity(0.9))
                        
                }
            }
            .padding(.bottom, 40)
            .padding(.horizontal, 40)
        }
        .background {
            Image("\( IMAGE_NoBraileSideWalkOnStreet0)")
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
                    .font(.sandoll(size: 20, weight: .semibold))
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: 20, weight: .semibold))
                    .foregroundColor(Color.dark)
            }
            .padding()
        }))
    }
}

struct Episode3_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_4View()
    }
}
