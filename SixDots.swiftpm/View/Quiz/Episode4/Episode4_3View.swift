//
//  Episode4_3View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_3View: View {
    
    @State private var numberOfClickNext = 0
    @State private var isCellPressed = Array(repeating: false, count: 6)
    var body: some View {
        ZStack {
            
            HStack {
                Image("\(IMAGE_StopBell)")
                
                if numberOfClickNext > 0 {
                    HStack (spacing: 35) {
                        VStack (spacing: 30) {
                            ForEach (0..<3) { cell in
                                CellView(isTapped: $isCellPressed[cell], cellSize: 100)
                                    .onTapGesture {
                                        isCellPressed[cell].toggle()
                                    }
                            }
                        }
                        
                        VStack (spacing: 35) {
                            ForEach (0..<3) { cell in
                                CellView(isTapped: $isCellPressed[cell + 3], cellSize: 100)
                                    .onTapGesture {
                                        isCellPressed[cell+3].toggle()
                                    }
                            }
                        }
                    }
                    .padding(40)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(Color.light)
                            .opacity(0.7)
                    }
                }
            }
            .padding(.bottom, 450)
            
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text(numberOfClickNext > 0 ? "Would you engrave braille for me?\nJust need **S**, the first letter of STOP to know!" : "Where the hell is the stop button? No matter how hard I look, there's no braille.")
                            .font(.sandoll(size: 35, weight: .regular))
                        
                        Text(numberOfClickNext > 0 ? "\n\nPlease engrave it in the braille on the screen!\nPress the NEXT button when you're done!" : "")
                            .font(.sandoll(size: 25, weight: .regular))
                    }
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Spacer()
                            
                            Button {
                                numberOfClickNext += 1
                            } label: {
                                NextButtonView()
                            }
                            .padding(20)
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
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
        }
        .ignoresSafeArea()
    }
}

struct Episode4_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_3View()
    }
}
