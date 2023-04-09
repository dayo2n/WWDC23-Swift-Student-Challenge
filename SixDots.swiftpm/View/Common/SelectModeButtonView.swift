//
//  SelectModeButtonView.swift
//  
//
//  Created by 제나 on 2023/04/07.
//

import SwiftUI

struct SelectModeButtonView: View {

    var iconImageName: String
    var modeName: String
    
    var body: some View {
        HStack {
            Image(systemName: "\(iconImageName)")
                .font(.sandoll(size: 20, weight: .regular))
            
            Text("\(modeName)")
                .font(.sandoll(size: 20, weight: .bold))
        }
        .frame(width: 200, height: 80)
        .foregroundColor(Color.light)
        .background {
            Capsule()
                .foregroundColor(Color.dark)
        }
        .overlay {
            Capsule()
                .stroke(Color.light, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct SelectModeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectModeButtonView(iconImageName: "questionmark.circle", modeName: "Introduction")
    }
}
