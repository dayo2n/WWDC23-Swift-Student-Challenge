//
//  Episode1_2View.swift
//  
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_2View: View {
    
    private let guidingTexts = ["This is the 10th floor of the building, so let's take the elevator down.", "Uh, wait, what is this?!"]
    @State private var numberOfClickNext = 0
    @Environment(\.dismiss) private var dismiss
    @State private var textOpacity = 0.0
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text("\(guidingTexts[numberOfClickNext])")
                                .font(.sandoll(size: geo.size.width * 0.05, weight: .medium))
                                .foregroundColor(Color.dark)
                                .lineSpacing(10)
                                .opacity(self.textOpacity)
                                .onAppear {
                                    textSize = geo.size.width * 0.05
                                    withAnimation(.easeIn) {
                                        self.textOpacity = 1.0
                                    }
                                }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                if numberOfClickNext == 0 {
                                    Button {
                                        dismiss()
                                    } label: {
                                        PrevButtonView(fontSize: textSize)
                                    }
                                    Spacer()
                                    Button {
                                        numberOfClickNext += 1
                                    } label: {
                                        NextButtonView(fontSize: textSize)
                                    }
                                } else {
                                    Button {
                                        numberOfClickNext -= 1
                                    } label: {
                                        PrevButtonView(fontSize: textSize)
                                    }
                                    Spacer()
                                    NavigationLink {
                                        Episode1_3View()
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
            Image("\(IMAGE_FrontElevator)")
                .resizable()
                .scaledToFill()
                .aspectRatio(numberOfClickNext == 0 ? 1.0 : 2.0, contentMode: .fill)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                    .font(.sandoll(size: textSize * 0.5, weight: .semibold))
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: textSize, weight: .semibold))
                    .foregroundColor(Color.dark)
            }
            .padding()
        }))
        .onChange(of: self.numberOfClickNext) { newValue in
            self.textOpacity = 0.0
            
            withAnimation(.easeIn) {
                self.textOpacity = 1.0
            }
        }
    }
}

struct Episode1_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_2View()
    }
}
