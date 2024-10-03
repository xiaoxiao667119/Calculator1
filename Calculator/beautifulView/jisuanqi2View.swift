import SwiftUI
import AVFoundation

struct CalculatorButton: View {
    var label: String
    @Binding var displayText: String
    @Binding var showSheet: Bool
    @Binding var audioPlayer: AVAudioPlayer?

    var body: some View {
        Button(action: {
            playSound()
            displayText += label
        }) {
            Text(label)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(
                    ZStack {
                        Color.gray
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.5), Color.clear]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing),
                                lineWidth: 4
                            )
                            .blur(radius: 1)
                    }
                )
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 5, y: 5)
                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        }
        .onLongPressGesture(minimumDuration: 1.0) {
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            showSheet = true
        }
    }

    func playSound() {
        audioPlayer?.play()
    }
}
