//
//  Episode2_3View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode2_3View: View {
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
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Ah, there it is.\nThank you for making braille.\nBraille before 1 is a number sign. \nDoesn't it look like a flipped L?\n\n**Anyway, I hope every button on the other floor has braille...🥺**")
                            .font(.sandoll(size: 35, weight: .regular))
                            .lineSpacing(10)
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                
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
            Image("\(IMAGE_InsideElevator)")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
        }
        .ignoresSafeArea()
    }
}

struct Episode2_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_3View()
    }
}
