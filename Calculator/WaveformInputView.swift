import SwiftUI

struct WaveformInputView: View {
    @State private var amplitude: String = "50.0"
    @State private var frequency: String = "3.0"
    @State private var initialPhase: String = "0.0"
    @State private var time: Double = 0.0
    @State private var isPlotting: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Waveform Parameters")
                .font(.title)
            
            HStack {
                Text("幅值:")
                TextField("Enter amplitude", text: $amplitude)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("频率:")
                TextField("Enter frequency", text: $frequency)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("初相角:")
                TextField("Enter initial phase", text: $initialPhase)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
            }
            
            HStack {
                Text("时间:")
                TextField("Enter time", value: $time, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
                    .padding(.horizontal)
            }
            
            Button(action: {
                isPlotting.toggle()
            }) {
                Text("作图")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            if isPlotting {
                WaveformView(amplitude: Double(amplitude) ?? 1.0, frequency: Double(frequency) ?? 1.0, initialPhase: Double(initialPhase) ?? 0.0, time: $time)
                    .frame(height: 200)
            }
        }
        .padding()
    }
}

struct WaveformInputView_Previews: PreviewProvider {
    static var previews: some View {
        WaveformInputView()
    }
}
