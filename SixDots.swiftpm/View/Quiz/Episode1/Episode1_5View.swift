//
//  Episode1_5View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode1_5View: View {
    var body: some View {
        ZStack {
            
            Image("\(IMAGE_DownButtonWithCorrectedBraille)")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .padding(.bottom, 500)
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("The down button should be **‘DOWN’** or abbreviated as **‘DWN’** in Braille so I can read it.")
                            .font(.sandoll(size: 35, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                    }
                        
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                Episode2_1View()
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

struct Episode1_5View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_5View()
    }
}
