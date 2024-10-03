//import SwiftUI
//import Expression
//
//struct ContentView: View {
//    @State private var display = "0"
//    @State private var history: [String] = []
//    @State private var showingHistory = false
//    @StateObject private var themeManager = ThemeManager()
//    
//    var body: some View {
//        NavigationView {
//            GeometryReader { geometry in
//                VStack {
//                    Spacer()
//                    Text(display)
//                        .font(.largeTitle)
//                        .padding()
//                        .frame(maxWidth: .infinity, alignment: .trailing)
//                        .foregroundColor(themeManager.foregroundColor)
//                    Spacer()
//                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 10) {
//                        ForEach(buttons.flatMap { $0 }, id: \.self) { button in
//                            Button(action: {
//                                buttonTapped(button)
//                            }) {
//                                Text(button)
//                                    .font(.largeTitle)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                    .aspectRatio(1, contentMode: .fit)
//                                    .foregroundColor(.white)
//                                    .background(buttonColors[button, default: .gray])
//                                    .cornerRadius(10)
//                                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
//                                    .padding(2)
//                            }
//                        }
//                    }
//                }
//                .padding()
//                .background(themeManager.backgroundColor)
//                .navigationBarItems(leading: Button(action: {
//                    showingHistory.toggle()
//                }) {
//                    Text("History")
//                }, trailing: Menu {
//                    ForEach(Theme.allCases) { theme in
//                        Button(action: {
//                            themeManager.selectedTheme = theme
//                        }) {
//                            Text(theme.rawValue.capitalized)
//                        }
//                    }
//                } label: {
//                    Text("Theme")
//                })
//                .sheet(isPresented: $showingHistory) {
//                    HistoryView(history: $history)
//                }
//            }
//        }
//        .environmentObject(themeManager)
//    }
//    
//    func buttonTapped(_ button: String) {
//        if button == "C" {
//            display = "0"
//        } else if button == "=" {
//            calculateResult()
//        } else if button == "%" {
//            if let value = Double(display) {
//                display = String(value / 100)
//            }
//        } else if button == "√" {
//            if let value = Double(display) {
//                display = String(sqrt(value))
//            }
//        } else if button == "log" {
//            if let value = Double(display) {
//                display = String(log10(value))
//            }
//        } else {
//            if button == "." {
//                let parts = display.split { String($0).isOperator }
//                if let lastPart = parts.last, lastPart.contains(".") {
//                    return
//                }
//            }
//            if display == "0" {
//                if button == "-" {
//                    display = button
//                } else if button == "(" || button == ")" {
//                    display = button
//                } else {
//                    display = button
//                }
//            } else if let lastChar = display.last, String(lastChar).isOperator {
//                if button.isOperator {
//                    display.removeLast()
//                    display.append(button)
//                } else {
//                    display.append(button)
//                }
//            } else {
//                display.append(button)
//            }
//        }
//    }
//    
//    func calculateResult() {
//        do {
//            let expression = try Expression(display.replacingOccurrences(of: "^", with: "**"))
//            let result = try expression.evaluate()
//            history.append("\(display) = \(result)")
//            display = String(result)
//        } catch {
//            display = "Invalid Expression"
//        }
//    }
//}
//
//let buttons: [[String]] = [
//    ["C", "(", ")", "/"],
//    ["7", "8", "9", "*"],
//    ["4", "5", "6", "-"],
//    ["1", "2", "3", "+"],
//    ["0", ".", "=", "^"],
//    ["log"]
//]
//
//let buttonColors: [String: Color] = [
//    "C": .red,
//    "(": .orange,
//    ")": .orange,
//    "/": .orange,
//    "*": .orange,
//    "-": .orange,
//    "+": .orange,
//    "=": .green,
//    "^": .orange,
//    "log": .orange
//]
//
//extension String {
//    var isOperator: Bool {
//        return self == "/" || self == "*" || self == "-" || self == "+" || self == "^"
//    }
//}
//
//class ThemeManager: ObservableObject {
//    @Published var selectedTheme: Theme = .light
//    
//    var backgroundColor: Color {
//        switch selectedTheme {
//        case .light: return .white
//        case .dark: return .black
//        case .blue: return .blue
//        case .green: return .green
//        }
//    }
//    
//    var foregroundColor: Color {
//        switch selectedTheme {
//        case .light: return .black
//        case .dark: return .white
//        case .blue: return .white
//        case .green: return .white
//        }
//    }
//}
//
//enum Theme: String, CaseIterable, Identifiable {
//    case light
//    case dark
//    case blue
//    case green
//    
//    var id: String { self.rawValue }
//}
//
//struct HistoryView: View {
//    @Binding var history: [String]
//    
//    var body: some View {
//        NavigationView {
//            List(history, id: \.self) { expression in
//                Text(expression)
//            }
//            .navigationBarTitle("History")
//            .navigationBarItems(trailing: Button(action: {
//                history.removeAll()
//            }) {
//                Text("Clear")
//            })
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

import SwiftUI

struct ContentView: View {
    var body: some View {
        AdvancedCalculatorView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

