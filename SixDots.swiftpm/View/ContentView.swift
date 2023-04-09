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
                    TutorialView()
                } label: {
                    SelectModeButtonView(iconImageName: "books.vertical", modeName: "Tutorial")
                }

                NavigationLink {
                    
                } label: {
                    SelectModeButtonView(iconImageName: "graduationcap.fill", modeName: "Quiz")
                }
            }
        }
    }
}
