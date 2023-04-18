//
//  Episode2_1View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode2_1View: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        Text("I think the elevator has arrived, so let's hurry up and get on.")
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
                                Episode2_2View()
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

struct Episode2_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_1View()
    }
}
