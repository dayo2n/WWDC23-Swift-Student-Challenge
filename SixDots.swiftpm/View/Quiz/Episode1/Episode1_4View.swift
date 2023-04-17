//
//  Episode1_4View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode1_4View: View {
    @State private var isRotating = 0.0
    @State private var isMoving = 0
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("\(IMAGE_DownButtonWithWrongBraille)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width * 0.6)
                    .padding(.bottom, 500)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text("Braille on this down button does not say **'DOWN'**.\nThe contractor simply **rotated the 'UP' button 180 degrees.**")
                                .font(.sandoll(size: 35, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                        }
                            
                        VStack {
                            Spacer()
                            
                            HStack {
                                Spacer()
                                
                                NavigationLink {
                                    Episode1_5View()
                                } label: {
                                    NextButtonView()
                                }
                                .padding(20)
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
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image("\(IMAGE_CroppedUpButton)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220)
                            .rotationEffect(.degrees(isRotating))
                            .offset(x: -100, y: CGFloat(isMoving))
                            .onAppear {
                                withAnimation(.linear(duration: 1.0)) {
                                        isRotating = 190.0
                                    }
                                
                                withAnimation(.linear(duration: 1.0).delay(1.0)) {
                                    isMoving = Int(geo.size.height / 3)
                                    }
                            }
                            .padding(30)
                        
                        Spacer()
                    }
                    
                    Spacer()
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
}

struct Episode1_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_4View()
    }
}
