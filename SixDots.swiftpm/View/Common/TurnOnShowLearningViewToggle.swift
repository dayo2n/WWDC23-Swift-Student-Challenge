//
//  TurnOnShowLearningViewToggle.swift
//  
//
//  Created by 제나 on 2023/04/10.
//

import SwiftUI

struct TurnOnShowLearningViewToggle: View {
    
    @Binding var turnOnShowLearningView: Bool
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text("Show Help")
                    .font(.sandoll(size: 20, weight: .bold))
                
                HStack {
                    Image(systemName: turnOnShowLearningView ? "lightbulb" : "lightbulb.slash")
                        .font(.sandoll(size: 25, weight: .bold))
                        .foregroundColor(turnOnShowLearningView ? Color.keyColor :Color.dark)
                    
                    Toggle("", isOn: $turnOnShowLearningView)
                }
                .padding(.horizontal, 30)
            }
            .frame(width: 140, height: 120)
            .overlay {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .stroke(Color.light, lineWidth: 3)
            }
        }
    }
}
