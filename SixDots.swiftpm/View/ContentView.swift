import SwiftUI

struct ContentView: View {
    @State private var textSize = CGFloat(20)
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                VStack(spacing: geo.size.height * 0.1) {
                    Text("Someone needs you 😉")
                        .font(.sandoll(size: textSize * 1.5, weight: .bold))
                    NavigationLink {
                        Episode1_1View()
                    } label: {
                        HStack(spacing: 20) {
                            Image(systemName: "hand.point.up.braille.fill")
                                .font(.sandoll(size: textSize, weight: .regular))
                            
                            Text("Let me help her")
                                .font(.sandoll(size: textSize, weight: .bold))
                        }
                        .frame(width: geo.size.width * 0.5, height: geo.size.width * 0.1)
                        .foregroundColor(Color.white)
                        .background {
                            Capsule()
                                .foregroundColor(Color.keyColor)
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                textSize = min(geo.size.width, geo.size.height) * 0.05
            }
        }
    }
}
