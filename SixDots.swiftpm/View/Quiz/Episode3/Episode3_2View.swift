//
//  Episode3_2View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_2View: View {
    @State private var numberOfClickNext = 0
    @State private var imageBANGSize = 700
    @State private var textOpacity = 0.0
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ZStack {
                    HStack {
                        Text(numberOfClickNext == 0 ? "I can hear the sound of cars passing by..\nBut since there's a guiding tiles, it must not be a road for cars, right?" : "Oh, my gosh!!\n Someone rang a crack to let me know it's dangerous.\nMaybe the Braille walking block is installed incorrectly.")
                            .font(.sandoll(size: 35, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                            .opacity(textOpacity)
                            .onAppear {
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
                                PrevButtonView()
                            }

                            Spacer()
                            
                            if numberOfClickNext == 0 {
                                Button {
                                    numberOfClickNext += 1
                                } label: {
                                    NextButtonView()
                                }
                            } else {
                                NavigationLink {
                                    Episode3_3View()
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
            ZStack {
                Image("\(numberOfClickNext == 0 ? IMAGE_NoBraileSideWalkOnStreet0 : IMAGE_NoBraileSideWalkOnStreet1)")
                    .resizable()
                    .scaledToFill()
                
                if numberOfClickNext > 0 {
                    Image("\(IMAGE_Bang)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: CGFloat(imageBANGSize))
                        .padding([.trailing, .bottom], 200)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                imageBANGSize = 1200
                            }
                            withAnimation(.easeIn.delay(0.5)) {
                                imageBANGSize = 700
                            }
                        }
                }
            }
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            NavigationUtil.popToRootView()
        }, label: {
            HStack {
                Image(systemName: "house")
                    .font(.sandoll(size: 20, weight: .semibold))
                    .foregroundColor(Color.dark)
                Text("Home")
                    .font(.sandoll(size: 20, weight: .semibold))
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

struct Episode3_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_2View()
    }
}
