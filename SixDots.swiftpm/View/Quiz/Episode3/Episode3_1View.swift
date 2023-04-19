//
//  Episode3_1View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode3_1View: View {
    @State private var numberOfClickNext = 0
    @State private var textOpacity = 0.0
    @State private var textSize = CGFloat(20)
    
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text(numberOfClickNext == 0 ? "It's hard to even get out of the building..." : "I can go home by bus coming to the bus stop in front of this building.\nBut I have to cross the crosswalk once to the bus stop.")
                                .font(.sandoll(size: textSize, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(textOpacity)
                                .onAppear {
                                    textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
                                    withAnimation(.easeIn) {
                                        textOpacity = 1.0
                                    }
                                }
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
                                    PrevButtonView(fontSize: textSize)
                                }

                                Spacer()
                                
                                if numberOfClickNext == 0 {
                                    Button {
                                        numberOfClickNext += 1
                                    } label: {
                                        NextButtonView(fontSize: textSize)
                                    }
                                } else {
                                    NavigationLink {
                                        Episode3_2View()
                                    } label: {
                                        NextButtonView(fontSize: textSize)
                                    }
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
        }
        .background {
            Image(numberOfClickNext == 0 ? "\(IMAGE_XHENA3)" : "\(IMAGE_XHENA4)")
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
        .onChange(of: self.numberOfClickNext) { newValue in
            self.textOpacity = 0.0
            
            withAnimation(.easeIn) {
                self.textOpacity = 1.0
            }
        }
    }
}

struct Episode3_1View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_1View()
    }
}
