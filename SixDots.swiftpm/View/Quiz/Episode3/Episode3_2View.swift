//
//  Episode3_2View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_2View: View {
    @State private var numberOfClickNext = 0
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(numberOfClickNext == 0 ? "I can hear the sound of cars passing by..\nBut since there's a directional tiles, it must not be a road for cars, right?" : "Oh, my gosh!!\nIt must have been a directional tiles, but it must have been wrong.")
                            .font(.sandoll(size: 35, weight: .regular))
                            .lineSpacing(10)
                    }
                    HStack {
                        Spacer()
                        
                        VStack {
                            Spacer()
                            
                            if numberOfClickNext == 0 {
                                Button {
                                    numberOfClickNext += 1
                                } label: {
                                    NextButtonView()
                                }
                                .padding(20)
                            } else {
                                NavigationLink {
                                    Episode3_3View()
                                } label: {
                                    NextButtonView()
                                }
                                .padding(20)
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
            Image("\(numberOfClickNext == 0 ? IMAGE_NoBraileSideWalkOnStreet0 : IMAGE_NoBraileSideWalkOnStreet1)")
                .resizable()
                .scaledToFill()
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

struct Episode3_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_2View()
    }
}
