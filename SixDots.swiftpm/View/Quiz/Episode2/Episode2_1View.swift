//
//  Episode2_1View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode2_1View: View {
    var body: some View {
        ZStack {
            Image("XHENA2")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 100)
                .padding(.top, 200)
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Surprised it's unreadable Braille, thanks for your help!")
                            .font(.sandoll(size: 35, weight: .regular))
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
        .ignoresSafeArea()
    }
}

struct Episode2_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_1View()
    }
}
