//
//  Episode3_1View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode3_1View: View {
    @State private var numberofClickNext = 0
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(numberofClickNext == 0 ? "It's hard to even get out of the building..." : "Now, there is a bus coming to the bus stop in front of this building, and I go home by that bus.\nBut I have to cross the crosswalk once to the bus stop.")
                            .font(.sandoll(size: 35, weight: .regular))
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                numberofClickNext += 1
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
            Image(numberofClickNext == 0 ? "XHENA3" : "XHENA4")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 100)
                .padding(.top, 200)
                .padding(.bottom, 20)
        }
        .ignoresSafeArea()
    }
}

struct Episode3_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_1View()
    }
}