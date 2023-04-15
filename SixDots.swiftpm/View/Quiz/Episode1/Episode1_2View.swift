//
//  Episode1_2View.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_2View: View {
    
    private let guidingTexts = ["This is the 10th floor of the building, so I have to take the elevator down.", "This is the 1-th floor of the building, so I have to take the elevator down.\nUh, wait, what the hell is this?!"]
    @State private var numberOfClicks = 0
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("\(guidingTexts[numberOfClicks])")
                            .font(.sandoll(size: 35, weight: .regular))
                            .foregroundColor(Color.dark)
                    }
                        
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                numberOfClicks += 1
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
        }
        .ignoresSafeArea()
    }
}

struct Episode1_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_2View()
    }
}
