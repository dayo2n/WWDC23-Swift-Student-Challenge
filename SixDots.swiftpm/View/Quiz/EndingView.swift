//
//  EndingView.swift
//  
//
//  Created by 제나 on 2023/04/19.
//

import SwiftUI



struct EndingView: View {
    @Environment(\.dismiss) private var dismiss
    private let texts = ["Thank you for helping me!",
                         "The world is not safe for the blind yet, so it's not easy to go around alone if there's no one to help.",
                         "Braille typos, of course, are difficult to read if the marking standard or printing material is not good, and there are many places where there is no Braille mark at all.",
                         "Just by knowing a little and paying attention, I expect a world where we can all live without worries.",
                         "\nIt was nice to meet you. Let's meet again next time!"]
    @State private var typedText = ""
    private let fullText = "Thank you for helping me!\nThe world is not safe for the blind yet, so it's not easy to go around alone if there's no one to help.\nBraille typos, of course, are difficult to read if the marking standard or printing material is not good, and there are many places where there is no Braille mark at all.\nJust by knowing a little and paying attention, I expect a world where we can all live without worries.🫶\n\nIt was nice to meet you.\nLet's meet again next time!☺️"
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    HStack {
                        Text("\(typedText)")
                            .font(.sandoll(size: 40, weight: .medium))
                            .foregroundColor(Color.dark)
                            .lineSpacing(10)
                            .onAppear {
                                _ = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                                    if typedText.count < fullText.count {
                                        typedText += String(fullText[fullText.index(fullText.startIndex, offsetBy: typedText.count)])
                                    } else {
                                        timer.invalidate()
                                    }
                                }
                            }
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
                        }
                    }
                }
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.light.opacity(0.9))
                }
            }
            .padding(.vertical, 40)
            .padding(.horizontal, 40)
        }
        .background {
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .blur(radius: 15)
                .grayscale(0.7)
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

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
