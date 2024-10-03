import SwiftUI
import AVFoundation

struct jisuanqi1View: View {
    @State private var displayText = ""
    @State private var showSheet = false
    @State private var audioPlayer: AVAudioPlayer?

    var body: some View {
        VStack(spacing: 20) {
            Text(displayText)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, minHeight: 100)
                .background(Color.gray)
                .foregroundColor(.white)
                .padding()

            CalculatorButton(label: "7", displayText: $displayText, showSheet: $showSheet, audioPlayer: $audioPlayer)
            CalculatorButton(label: "8", displayText: $displayText, showSheet: $showSheet, audioPlayer: $audioPlayer)
            CalculatorButton(label: "9", displayText: $displayText, showSheet: $showSheet, audioPlayer: $audioPlayer)

            Spacer()
        }
        .sheet(isPresented: $showSheet) {
            jisuanqi3View()
        }
        .onAppear {
            prepareSound()
        }
    }

    func prepareSound() {
        if let soundURL = Bundle.main.url(forResource: "N56BNFY-click", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Failed to load sound file: \(error)")
            }
        }
    }
}

//struct NewPageView: View {
//    var body: some View {
//        VStack {
//            Text("新页面")
//                .font(.largeTitle)
//                .padding()
//            Spacer()
//        }
//    }
//}

struct jisuanqi1View_Previews: PreviewProvider {
    static var previews: some View {
        jisuanqi1View()
    }
}
