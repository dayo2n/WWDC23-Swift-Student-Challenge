//
//  Episode1_1View.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_1View: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ZStack {
                    HStack(spacing: 20) {
                        Text("Hi, My name is XHENA!\nI’m visually impaired\nI went out today, but now I have to go home alone after finishing my business.\n\n**Can you help me get home?**")
                            .font(.sandoll(size: 35, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                        
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
            Image("XHENA1")
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
