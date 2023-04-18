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
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        Text("\(guidingTexts[numberOfClickNext])")
                            .font(.sandoll(size: 35, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                            .opacity(self.textOpacity)
                            .onAppear {
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
                                    PrevButtonView()
                                }

                                Spacer()
                                Button {
                                    numberOfClickNext += 1
                                } label: {
                                    NextButtonView()
                                }
                            } else {
                                Button {
                                    numberOfClickNext -= 1
                                } label: {
                                    PrevButtonView()
                                }

                                Spacer()
                                NavigationLink {
                                    Episode1_3View()
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

struct Episode1_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_2View()
    }
}
