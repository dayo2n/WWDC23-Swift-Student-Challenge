//
//  TutorialLevelSelctionView.swift
//
//
//  Created by 제나 on 2023/04/08.
//

import SwiftUI

struct TutorialLevelSelctionView: View {
    var body: some View {
        VStack(spacing:30) {
            NavigationLink {
                TutorialNumberView()
            } label: {
                SelectModeButtonView(iconImageName: "number.circle", modeName: "Numbers")
            }
            
            NavigationLink {
                TutorialAlphabetView()
            } label: {
                SelectModeButtonView(iconImageName: "textformat.abc", modeName: "Alphabet")
            }
        }
    }
}

struct TutorialLevelSelctionView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialLevelSelctionView()
    }
}
