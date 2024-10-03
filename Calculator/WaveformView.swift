import SwiftUI

struct WaveformView: View {
    var amplitude: Double
    var frequency: Double
    var initialPhase: Double
    @Binding var time: Double
    
    @State private var phase: Double = 0.0
    @State private var timer: Timer?
    
    var body: some View {
        Canvas { context, size in
            let path = sineWavePath(in: size)
            context.stroke(path, with: .color(.blue), lineWidth: 2)
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func sineWavePath(in size: CGSize) -> Path {
        var path = Path()
        let midHeight = size.height / 2
        let width = size.width
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        for x in stride(from: 0, to: width, by: 1) {
            let angle = (frequency * (x / width) * 2 * .pi) + initialPhase + phase
            let y = amplitude * sin(angle)
            path.addLine(to: CGPoint(x: x, y: midHeight + y))
        }
        
        return path
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            time += 0.01
            phase = frequency * time * 1 * .pi
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

struct WaveformView_Previews: PreviewProvider {
    static var previews: some View {
        WaveformView(amplitude: 1.0, frequency: 1.0, initialPhase: 0.0, time: .constant(0.0))
    }
}
