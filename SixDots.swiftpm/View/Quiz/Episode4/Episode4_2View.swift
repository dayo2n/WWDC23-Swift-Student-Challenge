//
//  Episode4_2View.swift
//
//
//  Created by 제나 on 2023/04/16.
//

import SwiftUI

struct Episode4_2View: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack {
            
            VStack {
                Spacer()
                
                ZStack {
                    HStack {
                        Text("If we get off at the next stop, it's my house.")
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
                                Episode4_3View()
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
            Image("\(IMAGE_InsideBus)")
                .resizable()
                .scaledToFill()
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

struct Episode4_2View_Previews: PreviewProvider {
    static var previews: some View {
        Episode4_2View()
    }
}
