//
//  Episode3_3View.swift
//
//
//  Created by 제나 on 2023/04/17.
//

import SwiftUI

struct Episode3_3View: View {
    @State private var numberOfClickNext = 0
    @State private var isStopBlock = Array(repeating: false, count: 5)
    var body: some View {
        ZStack {
            ZStack {
                Image("\(IMAGE_Crosswalk)")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 550)
                
                VStack {
                    HStack {
                        ForEach(0..<5) { index in
                            Image("\(isStopBlock[index] ? IMAGE_StopBlock : IMAGE_GuidanceBlock)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120)
                                .onTapGesture {
                                    isStopBlock[index].toggle()
                                }
                        }
                    }
                    Image("\(IMAGE_GuidanceBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                    Image("\(IMAGE_GuidanceBlock)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                }
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        
                        Text("There're some invalid Braille blocks.\nIn front of the crosswalk, there should be a warning tile that means stop and be careful.\nPlease change the wrong blocks!")
                            .font(.sandoll(size: 35, weight: .regular))
                            .lineSpacing(10)
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
            Image("\( IMAGE_NoBraileSideWalkOnStreet0)")
                .resizable()
                .scaledToFill()
                .blur(radius: 10)
        }
        .ignoresSafeArea()
    }
}

struct Episode3_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode3_3View()
    }
}
