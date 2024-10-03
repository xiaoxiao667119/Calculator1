import SwiftUI

struct jidianbaohuView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    @State private var showRelayProtectionView = false
    
    let buttons: [[String]] = [
        ["7", "8", "9", "÷", "sin", "cos", "tan"],
        ["4", "5", "6", "×", "log", "√", "^"],
        ["1", "2", "3", "−", "(", ")", "exp"],
        ["0", ".", "=", "+", "mod", "inv", "AC"]
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                VStack(alignment: .trailing, spacing: 5) {
                    Text(viewModel.display)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                    
                    Text(viewModel.realTimeResult)
                        .font(.title)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding([.leading, .trailing, .bottom])
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                .background(Color.gray.opacity(0.1))
                
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(buttons.flatMap { $0 }, id: \.self) { button in
                        Button(action: {
                            viewModel.handleButtonPress(button)
                        }) {
                            VStack {
                                Text("备用功能")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                Text(button)
                                    .font(.title2)
                                    .frame(minWidth: 60, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                                    .background(buttonBackgroundColor(for: button))
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                    .font(Font.custom("Microsoft YaHei", size: 24).bold())
                            }
                        }
                        .onLongPressGesture {
                            viewModel.performAlternateFunction(for: button)
                            let generator = UIImpactFeedbackGenerator(style: .medium)
                            generator.impactOccurred()
                        }
                    }
                }
                .padding(5)
                .background(Color.black.opacity(0.1))
                
                Button(action: {
                    showRelayProtectionView = true
                }) {
                    Text("继电保护")
                        .font(.title)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
                .sheet(isPresented: $showRelayProtectionView) {
                    RelayProtectionView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
    
    func buttonBackgroundColor(for button: String) -> Color {
        switch button {
        case "sin", "cos", "tan", "log", "√", "^", "exp", "mod", "inv":
            return Color.blue.opacity(0.7)
        case "÷", "×", "−", "+", "=", "AC":
            return Color.orange.opacity(0.7)
        default:
            return Color.gray.opacity(0.5)
        }
    }
}

struct jidianbaohuView_Previews: PreviewProvider {
    static var previews: some View {
        jidianbaohuView()
            .previewDevice("iPhone 15 Pro")
    }
}
