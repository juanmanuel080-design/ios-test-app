import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Hello, Vibe Coding!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Your first iOS app is running 🚀")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
