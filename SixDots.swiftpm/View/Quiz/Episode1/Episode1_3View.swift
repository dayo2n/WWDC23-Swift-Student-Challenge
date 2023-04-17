//
//  Episode1_3View.swift
//
//
//  Created by 제나 on 2023/04/15.
//

import SwiftUI

struct Episode1_3View: View {
    
    @State private var clickedUpButton = false
    @State private var clickedDownButton = false
    @State private var activateNavigationToNextView = false
    @State private var showHint = false
    
    var body: some View {
        ZStack {
            
            NavigationLink(destination: Episode1_4View(), isActive: $activateNavigationToNextView) {
                EmptyView()
            }
            
            Image("\(IMAGE_DownButtonWithWrongBraille)")
                .resizable()
                .scaledToFit()
                .frame(width: 500)
                .padding(.bottom, 500)
            
            VStack {
                Spacer()
                
                ZStack {
                    VStack(alignment: .center, spacing: 20) {
                        Text("The button on the elevator is weird.\n**Is the wrong button a up button or a down button?**\n\nIf you need a help, press the **hint button!**")
                            .font(.sandoll(size: 35, weight: .regular))
                            .foregroundColor(Color.dark)
                        
                        Spacer()
                        
                        HStack(spacing: 50) {
                            Spacer()
                            Button {
                               clickedUpButton = true
                            } label: {
                                Text("UP")
                                    .font(.sandoll(size: 35, weight: .semibold))
                                    .foregroundColor(Color.dark)
                                    .padding(.vertical, 30)
                                    .frame(width: 300)
                                    .background(clickedUpButton ? Color.keyColor.opacity(0.8) : Color.dark.opacity(0.2))
                                    .cornerRadius(20)
                            }
                            
                            Button {
                               clickedDownButton = true
                            } label: {
                                Text("DOWN")
                                    .font(.sandoll(size: 35, weight: .semibold))
                                    .foregroundColor(Color.dark)
                                    .padding(.vertical, 30)
                                    .frame(width: 300)
                                    .background(clickedDownButton ?  Color.keyColor.opacity(0.8) :  Color.dark.opacity(0.2))
                                    .cornerRadius(20)
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 80)
                }
                .frame(height: 500)
                .padding(.horizontal, 15)
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
                .blur(radius: 15)
        }
        .ignoresSafeArea()
        .alert("Do it again🤓", isPresented: $clickedUpButton) {
            Button("Again", role: .cancel) {

            }
        }
        .alert("You did it🥳", isPresented: $clickedDownButton) {
            Button("Next", role: .cancel) {
                self.activateNavigationToNextView = true
            }
        }
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
        }), trailing: Button(action: {
            showHint = true
        }, label: {
            Text("Hint")
                .font(.sandoll(size: 20, weight: .semibold))
                .foregroundColor(Color.dark)
                .padding()
        }))
        .sheet(isPresented: $showHint) {
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Spacer()
                    Image("\(IMAGE_BrailleNeue_KosukeTakahashi)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    HStack {
                        Spacer()
                        Text("Image credits Kosuke Takahashi.")
                            .font(.sandoll(size: 15, weight: .regular))
                            .padding([.bottom, .trailing], 20)
                    }
                    Button {
                        showHint = false
                    } label: {
                        Text("Dismiss")
                            .font(.sandoll(size: 20, weight: .semibold))
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Episode1_3View_Previews: PreviewProvider {
    static var previews: some View {
        Episode1_3View()
    }
}
