import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing:30) {
                NavigationLink {
                    
                } label: {
                    SelectModeButtonView(iconImageName: "questionmark.circle", modeName: "Introduction")
                }
                
                NavigationLink {
                    Episode1_1View()
                } label: {
                    SelectModeButtonView(iconImageName: "graduationcap.fill", modeName: "Quiz")
                }

                NavigationLink {
                    TutorialLevelSelctionView()
                } label: {
                    SelectModeButtonView(iconImageName: "books.vertical", modeName: "Tutorial")
                }
            }
        }
    }
}
