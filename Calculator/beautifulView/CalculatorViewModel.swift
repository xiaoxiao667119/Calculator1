import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    @Published var realTimeResult = ""
    @Published var currentInput: String = ""
    
    func handleButtonPress(_ button: String) {
        switch button {
        case "AC":
            display = "0"
            currentInput = ""
            realTimeResult = ""
        case "C":
            if !currentInput.isEmpty {
                currentInput.removeLast()
                display = currentInput
            }
        case "=":
            calculateResult()
        case "±":
            toggleSign()
        case "cos", "sin", "exp", "acos", "tan":
            currentInput += "\(button)("
            display = currentInput
        case "÷", "×", "−", "+", ".", "(", ")":
            if !currentInput.isEmpty {
                currentInput += button
                display = currentInput
            }
        default:
            if display == "0" {
                display = button
                currentInput = button
            } else {
                display += button
                currentInput += button
            }
            updateRealTimeResult()
        }
    }
    
    func performAlternateFunction(for button: String) {
        // 实现备用功能的逻辑
    }
    
    func calculateResult() {
        let result = evaluateExpression(currentInput)
        display = result
        realTimeResult = result
    }
    
    func updateRealTimeResult() {
        calculateResult()
    }
    
    func toggleSign() {
        if currentInput.hasPrefix("-") {
            currentInput.removeFirst()
        } else {
            currentInput = "-" + currentInput
        }
        display = currentInput
    }
    
    func formatResult(_ result: Double) -> String {
        return result.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", result) : String(result)
    }
    
    func evaluateExpression(_ expressionString: String) -> String {
        var expressionString = expressionString
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "−", with: "-")
        
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "cos") { cos($0 * .pi / 180) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "sin") { sin($0 * .pi / 180) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "exp") { exp($0) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "acos") { acos($0) * 180 / .pi }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "tan") { tan($0 * .pi / 180) }
        
        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            return formatResult(result)
        } else {
            return "Error"
        }
    }
    
    func replaceFunctionCalls(in expressionString: String, functionName: String, transform: @escaping (Double) -> Double) -> String {
        let pattern = "\(functionName)\\(([^()]*)\\)"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let range = NSRange(location: 0, length: expressionString.utf16.count)
        var newString = expressionString
        
        regex.enumerateMatches(in: expressionString, options: [], range: range) { match, _, _ in
            guard let match = match else { return }
            let valueRange = Range(match.range(at: 1), in: expressionString)!
            let valueString = String(expressionString[valueRange])
            if let value = Double(valueString) {
                let transformedValue = transform(value)
                newString = (newString as NSString).replacingCharacters(in: match.range, with: "\(transformedValue)")
            }
        }
        return newString
    }
}
