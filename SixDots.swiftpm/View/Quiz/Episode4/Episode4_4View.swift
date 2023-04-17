//
//  Episode4_4View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_4View: View {
    var body: some View {
        ZStack {
            
            Image("\(IMAGE_StopBellWithBraille)")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 500)
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Blind people can't even find the location of the bus stop bell, but it's more difficult without braille.")
                            .font(.sandoll(size: 35, weight: .regular))
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
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
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
        }
        .ignoresSafeArea()
    }
}

struct Episode4_4View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_4View()
    }
}
