//
//  Episode4_1View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_1View: View {
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("Now, there is a bus coming to the bus stop in front of this building, and I go home by that bus.")
                            .font(.sandoll(size: 35, weight: .regular))
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            NavigationLink {
                                Episode4_2View()
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
            Image("XHENA2")
                .resizable()
                .scaledToFit()
                .rotation3DEffect(.degrees(180), axis: (x: 0, y:1, z:0))
                .padding(.horizontal, 100)
                .padding(.top, 200)
        }
        .ignoresSafeArea()
    }
}

struct Episode4_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_1View()
    }
}
