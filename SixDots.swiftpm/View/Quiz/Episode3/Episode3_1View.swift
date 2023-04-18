//
//  Episode3_1View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode3_1View: View {
    @State private var numberOfClickNext = 0
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    HStack {
                        Text(numberOfClickNext == 0 ? "It's hard to even get out of the building..." : "Now, there is a bus coming to the bus stop in front of this building, and I go home by that bus.\nBut I have to **cross the crosswalk once** to the bus stop.")
                            .font(.sandoll(size: 35, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button {
                                if numberOfClickNext == 0 {
                                    dismiss()
                                } else {
                                    numberOfClickNext -= 1
                                }
                            } label: {
                                PrevButtonView()
                            }

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
                                    Episode3_2View()
                                } label: {
                                    NextButtonView()
                                }
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
            Image(numberOfClickNext == 0 ? "XHENA3" : "XHENA4")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 100)
                .padding(.top, 200)
                .padding(.bottom, 20)
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

struct Episode3_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_1View()
    }
}
