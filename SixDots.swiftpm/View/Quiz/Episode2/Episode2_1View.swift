//
//  Episode2_1View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode2_1View: View {
    @State private var textSize = CGFloat(20)
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text("I think the elevator has arrived, so let's hurry up and get on.")
                                .font(.sandoll(size: textSize, weight: .medium))
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
                                    PrevButtonView(fontSize: textSize)
                                }
                                Spacer()
                                NavigationLink {
                                    Episode2_2View()
                                } label: {
                                    NextButtonView(fontSize: textSize)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, textSize)
                    .frame(height: geo.size.height * 0.45)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light.opacity(0.9))
                    }
                }
                .padding(.bottom, textSize)
                .padding(.horizontal, textSize)
            }
            .onAppear {
                textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
            }
        }
        .background {
            Image("\(IMAGE_XHENA2)")
                .resizable()
                .scaledToFit()
                .padding(.all, 50)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                    .font(.sandoll(size: textSize * 0.5, weight: .semibold))
                Text("Home")
                    .font(.sandoll(size: textSize, weight: .semibold))
            }
        }))
    }
}

struct Episode2_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode2_1View()
    }
}
