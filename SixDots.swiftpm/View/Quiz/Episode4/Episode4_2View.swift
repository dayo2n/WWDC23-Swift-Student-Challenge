//
//  Episode4_2View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_2View: View {
    @Environment(\.dismiss) private var dismiss
    @State private var leadingPadding = 0
    @State private var contentOpacity = 0.0
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Text("I'll almost be home once I get off at the next stop.")
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
                                    Episode4_3View()
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
                    .opacity(contentOpacity)
                }
                .padding(.bottom, textSize)
                .padding(.horizontal, textSize)
            }
            .onAppear {
                textSize = min(geo.size.width * 0.035, geo.size.height * 0.035)
            }
        }
        .background {
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .padding(.leading, CGFloat(leadingPadding))
                .onAppear(perform: {
                    withAnimation(.linear(duration: 0.7).repeatForever(autoreverses: true)) { 
                        leadingPadding = 20
                    }
                    withAnimation(.easeIn.delay(1.0)) { 
                        contentOpacity = 1.0
                    }
                })
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

struct Episode4_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_2View()
    }
}
