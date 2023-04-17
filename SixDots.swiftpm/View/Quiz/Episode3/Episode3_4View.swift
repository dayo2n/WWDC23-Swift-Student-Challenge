//
//  Episode3_4View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_4View: View {
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
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("The block on the left is the **guiding block** that says you can **go straight.**\n\nThe block on the right is the **stop block** that tells you to stop. It is usually used in front of the crosswalk or when the road is divided into several directions.")
                            .font(.sandoll(size: 35, weight: .regular))
                            .lineSpacing(10)
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                Episode4_1View()
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
        }
        .background {
            Image("\( IMAGE_NoBraileSideWalkOnStreet0)")
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                Text("Home")
            }
        }))
    }
}

struct Episode3_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_4View()
    }
}
