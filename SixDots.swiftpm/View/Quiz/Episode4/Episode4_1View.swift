//
//  Episode4_1View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_1View: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        Text("Oh, I can hear the bus coming!")
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
                                Episode4_2View()
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
            Image("XHENA2")
                .resizable()
                .scaledToFit()
                .rotation3DEffect(.degrees(180), axis: (x: 0, y:1, z:0))
                .padding(.horizontal, 100)
                .padding(.top, 200)
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

struct Episode4_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_1View()
    }
}
