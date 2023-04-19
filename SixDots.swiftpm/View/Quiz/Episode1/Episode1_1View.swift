//
//  Episode1_1View.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_1View: View {
    @State private var opacities = Array(repeating: 0.0, count: 4)
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    HStack(spacing: 20) {
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Hi, I'm XHENA!")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(opacities[0])
                                .onAppear {
                                    withAnimation(.easeIn) {
                                        self.opacities[0] = 1.0
                                    }
                                }
                            Text("And I’m **visually impaired.**")
                                .font(.sandoll(size: 40, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(opacities[1])
                                .onAppear {
                                    withAnimation(.easeIn.delay(1)) {
                                        self.opacities[1] = 1.0
                                    }
                                }
                            Text("I went out today, and now I'm done with my business, I have to go back home alone.\n")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(opacities[2])
                                .onAppear {
                                    withAnimation(.easeIn.delay(2)) {
                                        self.opacities[2] = 1.0
                                    }
                                }
                            Text("**Can you help me get home?**")
                                .font(.sandoll(size: 40, weight: .medium))
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
            Image("\(IMAGE_XHENA1)")
                .resizable()
                .scaledToFit()
                .padding(.all, 200)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                    .font(.sandoll(size: 20, weight: .semibold))
                Text("Home")
                    .font(.sandoll(size: 20, weight: .semibold))
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
