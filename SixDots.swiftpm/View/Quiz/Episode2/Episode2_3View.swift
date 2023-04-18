//
//  Episode2_3View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode2_3View: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            
            Image("\(IMAGE_FloorButtonWithBraille)")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 200)
                .padding(.bottom, 500)
            
            VStack {
                Spacer()
                
                ZStack {
                    HStack {
                        Text("Ah, there it is.\nThank you for making braille.\nBraille before 1 is a **number sign**. \nDoesn't it look like a flipped L?🤣\n\n**Anyway, I hope every button on the other floor has braille...🥺**")
                            .font(.sandoll(size: 35, weight: .medium))
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
                                PrevButtonView()
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                Episode3_1View()
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
            Image("\(IMAGE_InsideElevator)")
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
                Text("Home")
                    .font(.sandoll(size: 20, weight: .semibold))
            }
            .padding()
        }))
    }
}

struct Episode2_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_3View()
    }
}
