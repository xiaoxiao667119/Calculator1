import Foundation
import SwiftUI
import UIKit

struct AdvancedCalculatorView: View {
    @State private var display = "0"
    @State private var realTimeResult = ""
    @State private var isWaveformInputActive = false
    @State private var isBeautiful3ViewActive = false
    @State private var isrealButton1ViewActive = false
    @State private var iszuohuaViewActive = false
    @State private var isweixinViewActive = false
    @State private var isjisuanqi1ViewActive = false
    @State private var currentInput: String = ""
    @State private var isPowerActive = false
    @State private var selectedTab = 0
    @State private var showingMoreOptions = false

    

//    let buttons: [[String]] = [
//
//        // 第五行：三角函数与反三角函数
//        ["SS", "XX", "YY", "asin", "acos", "atan", "n!"],
//
//        // 第六行：双曲函数与反双曲函数
//        ["sinh", "cosh", "tanh", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "MR"],
//
//        // 第七行：高级数学与记忆功能
//        ["exp", "mod", "ZZ", "γ", "M+", "M-", "MRC"], // MRC 可作为清除内存并召回存储值的组合键
//
//        // 第八行：特殊功能与常量
//        ["f1", "±", "%", "Rand", "WW", "x²", "x³"],
//
//        // 第一行：数字与基本运算
//        ["sin", "cos", "tan","7", "8", "9", "÷"],
//
//        // 第二行：数字与基本运算
//        ["lg10", "ln", "logX","4", "5", "6", "×"],
//
//        // 第三行：数字与基本运算及常量
//        ["π", "e", "φ","1", "2", "3", "−"],
//
//        // 第四行：数字与基本运算
//        ["√", "^", "x⁻¹","0", ".", "=", "+"],
//
//        // 第九行：特殊功能键与更多操作
//        ["xʸ", "2ʸ", "10ʸ","AC", "(", ")", "C"],
//    ]
//
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]
    let buttons: [[String]] = [
        // 上面4行，每行7个按钮
//        ["f2", "f4", "f5", "asin", "acos", "atan", "n!"],
//        ["sinh", "cosh", "tanh", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "MR"],
//        ["exp", "mod", "f6", "Shift", "M+", "M-", "MRC"],
//        ["f1", "±", "%", "Rand", "f3", "x²", "x³"],
        
        ["f1", "exp", "mod",  "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "Alpha"],
        ["f2", "f3", "xʸ", "sinh","cosh", "tanh", "Shift"],
        ["f4", "f5", "f6", "asin", "acos", "atan", "n!"],
        ["Rand", "±", "%", "π", "M+", "M-", "MRC"],

        // 底下5行，每行6个按钮
        ["sin", "7", "8", "9", "÷", "MR"],
        ["cos", "4", "5", "6", "×", "√"],
        ["tan", "1", "2", "3", "−", "e"],
        ["lg10", "0", ".", "=", "+", "x²"],
        ["^", "AC", "(", ")", "C", "10ʸ"],
    ]

    var body: some View {
        TabView(selection: $selectedTab) {
            calculatorView()
                .tabItem {
                    Image(systemName: "plus.slash.minus")
                    Text("计算器")
                }
                .tag(0)

            NavigationLink(destination: FunctionView()) {
                EmptyView()
            }
            .tabItem {
                Image(systemName: "function")
                Text("函数")
            }
            .tag(1)

            NavigationLink(destination: UnitConversionView()) {
                EmptyView()
            }
            .tabItem {
                Image(systemName: "arrow.2.squarepath")
                Text("单位换算")
            }
            .tag(2)

            Button(action: {
                showingMoreOptions = true
            }) {
                Image(systemName: "ellipsis")
                Text("更多")
            }
            .tabItem {
                Image(systemName: "ellipsis")
                Text("更多")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.bottom)
        .actionSheet(isPresented: $showingMoreOptions) {
            ActionSheet(title: Text("更多选项"), buttons: [
                .default(Text("设置")) { /* 处理设置操作 */ },
                .default(Text("历史记录")) { /* 处理历史记录操作 */ },
                .default(Text("帮助")) { /* 处理帮助操作 */ },
                .default(Text("关于")) { /* 处理关于操作 */ },
                .cancel(),
            ])
        }
    }



    func calculatorView() -> some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    // Display area
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(display)
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                            .background(Color.gray.opacity(0.1))

                        Text(realTimeResult)
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding([.leading, .trailing, .bottom])
                    }
                    .frame(height: UIScreen.main.bounds.height / 3)
                    .background(Color.gray.opacity(0.1))

//                    //Buttons Grid
//                    LazyVGrid(columns: columns, spacing: 3) {
//                        ForEach(buttons.flatMap { $0 }, id: \.self) { button in
//                            Button(action: {
//                                switch button {
//                                case "f1":
//                                    isWaveformInputActive = true
//                                case "WW":
//                                    isBeautiful3ViewActive = true
//                                case "SS":
//                                    isrealButton1ViewActive = true
//                                case "XX":
//                                    iszuohuaViewActive = true
//                                case "YY":
//                                    isweixinViewActive = true
//                                case "ZZ":
//                                    isjisuanqi1ViewActive = true
//                                default:
//                                    handleButtonPress(button)
//                                }
//                            }) {
//                                Text(button)
//                    //                                    .font(.title2)
//                                    .font(.title3)
//                    //                                    .frame(CGFloat?)
//                    //                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 60)
//                                    .frame(minWidth: (buttonframeW1(for: button)), maxWidth: (buttonframeW2(for: button)), minHeight: (buttonframeH1(for: button)), maxHeight: (buttonframeH2(for: button)))
//                    //                                    .frame(buttonframe(for: button))
//                    //                                    .background(buttonBackgroundColor(for: button))
//                    //                                    .foregroundColor(.black)
//                    //                                    .cornerRadius(5)
//                    //                                    .padding()
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 15)//-xhx-这里的10和下面的10改成别的数字且一样，改倒角
//                    //                                            .fill(Color.gray)//-xhx-改填充色
//                                            .fill(buttonBackgroundColor(for: button))
//                                            .overlay(
//                                                RoundedRectangle(cornerRadius: 15)
//                                                    .stroke(Color.black.opacity(0.5), lineWidth: 1)//-xhx-2这个数值改边框线细，和下面两个数字保持相等
//                                                    .offset(x: 1, y: 1)
//                                            )
//                                            .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                                    )
//                    //                                    .foregroundColor(.white)//-xhx-改文字色
//                                    .foregroundColor(buttonforegroundColor(for: button))
//                            }
//                        }
//                    }
//                    .padding(5)
//                    .background(Color.black.opacity(0.1))
//
//                    Spacer()
//                }
//                .edgesIgnoringSafeArea(.bottom)

                    // Buttons Grid
                    VStack(spacing: 3) { // 增加行间距
                        ForEach(0 ..< buttons.count, id: \.self) { rowIndex in
                            HStack(spacing: rowIndex < 4 ? 3 : 7) { // 为底部5行增加列间距
                                ForEach(0 ..< (rowIndex < 4 ? 7 : 6), id: \.self) { columnIndex in
                                    if columnIndex < buttons[rowIndex].count {
                                        let button = buttons[rowIndex][columnIndex]
                                        Button(action: {
                                            generateHapticFeedback() // 添加震动效果
                                            switch button {
                                            case "f1":
                                                isWaveformInputActive = true
                                            case "f2":
                                                isBeautiful3ViewActive = true
                                            case "f3":
                                                isrealButton1ViewActive = true
                                            case "f4":
                                                iszuohuaViewActive = true
                                            case "f5":
                                                isweixinViewActive = true
                                            case "f6":
                                                isjisuanqi1ViewActive = true
                                            default:
                                                handleButtonPress(button)
                                            }
//                                            handleButtonPress(button)
                                        }) {
                                            Text(button)
                                                .font(.title3)
                                                .frame(minWidth: buttonframeW1(for: button),
                                                       maxWidth: .infinity, // 使按钮宽度自适应
                                                       minHeight: buttonframeH1(for: button),
                                                       maxHeight: buttonframeH2(for: button))
                                                .background(
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .fill(buttonBackgroundColor(for: button))
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 15)
                                                                .stroke(Color.black.opacity(0.5), lineWidth: 1)
                                                                .offset(x: 1, y: 1)
                                                        )
                                                        .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
                                                )
                                                .foregroundColor(buttonforegroundColor(for: button))
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(10) // 增加整体内边距
                    .background(Color.black.opacity(0.1))

                    Spacer()
                }
                .edgesIgnoringSafeArea(.bottom)

                // 导航链接应与激活状态关联，并且通常需要一个占位符视图
                if isWaveformInputActive {
                    NavigationLink(destination: WaveformInputView(), isActive: $isWaveformInputActive) {
                        EmptyView() // 这里可以是一个透明的占位符，实际按钮在外部
                    }
                    .hidden() // 确保导航链接自身不可见，仅通过按钮触发
                }
                if isBeautiful3ViewActive {
                    NavigationLink(destination:
//                                    beautiful3View()
                        TanchuView()
                        , isActive: $isBeautiful3ViewActive) {
                            EmptyView() // 同样，透明占位符
                        }
                        .hidden()
                }
                if isrealButton1ViewActive {
                    NavigationLink(destination: realButton1View(), isActive: $isrealButton1ViewActive) {
                        EmptyView() // 这里可以是一个透明的占位符，实际按钮在外部
                    }
                    .hidden() // 确保导航链接自身不可见，仅通过按钮触发
                }
                if iszuohuaViewActive {
                    NavigationLink(destination:
//                                    zuohuaView()
                        jidianbaohuView()
                        , isActive: $iszuohuaViewActive) {
                            EmptyView() // 同样，透明占位符
                        }
                        .hidden()
                }
                if isweixinViewActive {
                    NavigationLink(destination: weixinView(), isActive: $isweixinViewActive) {
                        EmptyView() // 这里可以是一个透明的占位符，实际按钮在外部
                    }
                    .hidden() // 确保导航链接自身不可见，仅通过按钮触发
                }
                if isjisuanqi1ViewActive {
                    NavigationLink(destination: jisuanqi1View(), isActive: $isjisuanqi1ViewActive) {
                        EmptyView() // 这里可以是一个透明的占位符，实际按钮在外部
                    }
                    .hidden() // 确保导航链接自身不可见，仅通过按钮触发
                }
            }
        }
    }

func generateHapticFeedback() {
    let impact = UIImpactFeedbackGenerator(style: .light)
    impact.impactOccurred()
}

    let functions: [String] = [
        "sin", // 正弦
        "cos", // 余弦
        "exp", // 指数
        "acos", // 反余弦
        "tan", // 正切
        "asin", // 反正弦
        "atan", // 反正切
        "lg10",
        "ln", // 自然对数
        "logX", // 常用对数（以10为底）
        "√", "^", "x⁻¹",
        "sqrt", // 平方根
        "cosh", // 双曲余弦
        "sinh", // 双曲正弦
        "tanh", // 双曲正切
        "abs", // 绝对值
        "round", // 四舍五入
        "floor", // 向下取整
        "ceil", // 向上取整
        "sign", // 符号函数，返回-1, 0, 1

        // 可以继续添加更多函数
    ]

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
        case "xʸ":
            currentInput += "^"
            display = currentInput
        case "÷", "×", "−", "+", ".":
            if !currentInput.isEmpty {
                currentInput += button
                display = currentInput
            }
        default:
            if functions.contains(button) {
                currentInput += "\(button)("
                display = currentInput
            } else {
                if display == "0" {
                    display = button
                    currentInput = button
                } else {
                    display += button
                    currentInput += button
                }
                updateRealTimeResult() // 实时计算结果
            }
        }
    }

    func replaceFunctionCalls(in expressionString: String, functionName: String, transform: @escaping (Double) -> Double) -> String {
        let regex = try! NSRegularExpression(pattern: "\(functionName)\\(([^)]*)\\)?", options: [])
        let range = NSRange(location: 0, length: expressionString.utf16.count)
        let newString = regex.stringByReplacingMatches(in: expressionString, options: [], range: range) { match in
            let valueRange = Range(match.range(at: 1), in: expressionString)!
            let valueString = String(expressionString[valueRange])
            if let value = Double(valueString) {
                return "\(transform(value))"
            }
            return "Error"
        }
        return newString
    }

    struct Fraction {
        var numerator: Int
        var denominator: Int

        init(_ numerator: Int, _ denominator: Int) {
            self.numerator = numerator
            self.denominator = denominator
            reduce()
        }

        init(_ value: Double) {
            let precision = 1000000.0
            let integral = Int(value * precision)
            self.init(integral, Int(precision))
        }

        private mutating func reduce() {
            let gcdValue = gcd(numerator, denominator)
            numerator /= gcdValue
            denominator /= gcdValue
        }

        private func gcd(_ a: Int, _ b: Int) -> Int {
            let r = a % b
            if r != 0 {
                return gcd(b, r)
            } else {
                return b
            }
        }

        var description: String {
            if denominator == 1 {
                return "\(numerator)"
            }
            return "\(numerator)/\(denominator)"
        }
    }

//    extension Fraction: CustomStringConvertible {}

    func factorialRecursive(_ n: Int) -> Int {
        if n == 0 || n == 1 {
            return 1
        } else {
            return n * factorialRecursive(n - 1)
        }
    }

    func evaluateExpression(_ expressionString: String) -> String {
        var expressionString = expressionString
            .replacingOccurrences(of: "×", with: "*")
            .replacingOccurrences(of: "÷", with: "/")
            .replacingOccurrences(of: "−", with: "-")

        // 临时替换 acos 为 ac0s，防止与 cos 冲突

        expressionString = expressionString.replacingOccurrences(of: "lg10", with: "l0g1") // 自然对数
        expressionString = expressionString.replacingOccurrences(of: "ln", with: "l0n1") // 自然对数的另一种表示
        expressionString = expressionString.replacingOccurrences(of: "logX", with: "l0gx") // 自然对数

        expressionString = expressionString.replacingOccurrences(of: "√", with: "sqrt1") // 开平方根
        expressionString = expressionString.replacingOccurrences(of: "^", with: "pow1") // 指数操作，虽然通常需要两个参数，但这里先简化处理
        expressionString = expressionString.replacingOccurrences(of: "x⁻¹", with: "inv1") // 倒数

        expressionString = expressionString.replacingOccurrences(of: "xʸ", with: "powVar1") // x的y次幂，需处理第二个参数
        expressionString = expressionString.replacingOccurrences(of: "2ʸ", with: "twoPowY1") // 2的y次幂，需处理第二个参数
        expressionString = expressionString.replacingOccurrences(of: "10ʸ", with: "tenPowY1") // 10的y次幂，需处理第二个参数

        expressionString = expressionString.replacingOccurrences(of: "asin", with: "asin1")
        expressionString = expressionString.replacingOccurrences(of: "acos", with: "acos1")
        expressionString = expressionString.replacingOccurrences(of: "atan", with: "atan1")
        expressionString = expressionString.replacingOccurrences(of: "n!", with: "fact1") // 阶乘

        expressionString = expressionString.replacingOccurrences(of: "sinh", with: "sinh1")
        expressionString = expressionString.replacingOccurrences(of: "cosh", with: "cosh1")
        expressionString = expressionString.replacingOccurrences(of: "tanh", with: "tanh1")
        expressionString = expressionString.replacingOccurrences(of: "sinh⁻¹", with: "asinh1")
        expressionString = expressionString.replacingOccurrences(of: "cosh⁻¹", with: "acosh1")
        expressionString = expressionString.replacingOccurrences(of: "tanh⁻¹", with: "atanh1")

        expressionString = expressionString.replacingOccurrences(of: "mod", with: "mod1") // 取模，需要考虑两个参数
        expressionString = expressionString.replacingOccurrences(of: "γ", with: "gammaConst1") // 欧拉-马斯刻若尼常数

        expressionString = expressionString.replacingOccurrences(of: "±", with: "negate1") // 正负号切换
        expressionString = expressionString.replacingOccurrences(of: "%", with: "percent1") // 百分比
        expressionString = expressionString.replacingOccurrences(of: "Rand", with: "random1") // 随机数
        expressionString = expressionString.replacingOccurrences(of: "!", with: "fact1") // 阶乘的另一种表示
        expressionString = expressionString.replacingOccurrences(of: "x²", with: "square1") // 平方
        expressionString = expressionString.replacingOccurrences(of: "x³", with: "cube1") // 立方

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "sin") { sin($0 * .pi / 180) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "cos") { cos($0 * .pi / 180) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "tan") { tan($0 * .pi / 180) }

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "l0g1") { log($0) / log(10) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "l0n1") { log($0) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "l0gx") { log($0) / log(10) }

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "sqrt1") { sqrt($0) } // 开平方根
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "pow1") { pow($0, 2) } // 示例：计算平方，这里需要调整逻辑以处理任意指数
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "inv1") { 1 / $0 } // 计算倒数

//        expressionString = replaceFunctionCalls(in: expressionString, functionName: "xʸ") { pow($0, $1) } // 计算任意次幂，需处理第二个参数
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "twoPowY1") { pow(2, $0) } // 2的$0次幂
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "10ʸ") { pow(10, $0) } // 10的$0次幂

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "asin1") { asin($0) * 180 / .pi } // 反正弦转换为度
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "acos1") { acos($0) * 180 / .pi } // 反余弦转换为度
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "atan1") { atan($0) * 180 / .pi } // 反正切转换为度
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "fact1") { Double(factorialRecursive(Int($0))) } // 阶乘，需自定义实现

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "sinh1") { sinh($0) } // 双曲正弦
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "cosh1") { cosh($0) } // 双曲余弦
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "tanh1") { tanh($0) } // 双曲正切
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "asinh1") { asinh($0) } // 反双曲正弦
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "acosh1") { acosh($0) } // 反双曲余弦
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "atanh1") { atanh($0) } // 反双曲正切

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "exp") { exp($0) }
//        expressionString = replaceFunctionCalls(in: expressionString, functionName: "mod") { $0.truncatingRemainder(dividingBy: $1) } // 取模运算，这里假设第二个参数是存在的，具体实现时需处理参数获取
        // 对于欧拉-马斯刻若尼常数γ，作为常数返回
//        expressionString = replaceFunctionCalls(in: expressionString, functionName: "gammaConst1") { 0.57721566490153286060651209 }

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "negate1") { -$0 } // 正负切换
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "percent1") { $0 / 100 } // 百分比转换
//        expressionString = replaceFunctionCalls(in: expressionString, functionName: "random1") { Double.random(in: 0...1) * 100 } // 生成0到100之间的随机数，根据需要调整范围

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "square1") { pow($0, 2) } // 计算平方
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "cube1") { pow($0, 3) } // 计算立方

        expressionString = replaceFunctionCalls(in: expressionString, functionName: "abs") { abs($0) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "ceil") { ceil($0) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "floor") { floor($0) }
        expressionString = replaceFunctionCalls(in: expressionString, functionName: "round") { round($0) }

        let expression = NSExpression(format: expressionString)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
//            return Fraction(result).description//显示分数
            return formatResult(result) // 显示小数
        } else {
            return "Error"
        }
    }

    func calculateResult() {
        let result = evaluateExpression(currentInput)
        display = result
        realTimeResult = result
    }

    func updateRealTimeResult() {
        realTimeResult = evaluateExpression(currentInput)
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

    func buttonframeW1(for button: String) -> CGFloat {
        switch button {
        case "f1", "f2", "f3", "f4", "f5", "f6":
            return 55
        case "÷", "×", "−", "+", "=":
            return 20
        case "sin", "cos", "tan", "lg10", "ln", "logX", "√", "^", "π", "exp", "mod", "inv", "n!", "sinh", "cosh", "tanh", "log2", "asin", "acos", "atan", "ln2", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "logf", "x²", "x³", "xʸ", "2ʸ", "eʸ", "10ʸ", "x!", "x⁻¹", "π", "e", "γ", "φ", "Rand":
            return 30
        case "AC", "±", "%":
            return 40
        default:
            return 50
        }
    }

    func buttonframeW2(for button: String) -> CGFloat {
        switch button {
        case "f1", "f2", "f3", "f4", "f5", "f6":
            return 60
        case "÷", "×", "−", "+", "=":
            return 60
        case "sin", "cos", "tan", "lg10", "ln", "logX", "√", "^", "π", "exp", "mod", "inv", "n!", "sinh", "cosh", "tanh", "log2", "asin", "acos", "atan", "ln2", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "logf", "x²", "x³", "xʸ", "2ʸ", "eʸ", "10ʸ", "x!", "x⁻¹", "π", "e", "γ", "φ", "Rand":
            return 60
        case "AC", "±", "%":
            return 60
        default:
            return 60
        }
    }

    func buttonframeH1(for button: String) -> CGFloat {
        switch button {
        case "f1", "f2", "f3", "f4", "f5", "f6":
            return 50
        case "÷", "×", "−", "+", "=":
            return 55
        case "sin", "cos", "tan", "lg10", "ln", "logX", "√", "^", "π", "exp", "mod", "inv", "n!", "sinh", "cosh", "tanh", "log2", "asin", "acos", "atan", "ln2", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "logf", "x²", "x³", "xʸ", "2ʸ", "eʸ", "10ʸ", "x!", "x⁻¹", "π", "e", "γ", "φ", "Rand":
            return 30
        case "AC", "±", "%":
            return 50
        default:
            return 45
        }
    }

    func buttonframeH2(for button: String) -> CGFloat {
        switch button {
        case "f1", "f2", "f3", "f4", "f5", "f6":
            return 50
        case "÷", "×", "−", "+", "=":
            return 55
        case "sin", "cos", "tan", "lg10", "ln", "logX", "√", "^", "π", "exp", "mod", "inv", "n!", "sinh", "cosh", "tanh", "log2", "asin", "acos", "atan", "ln2", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "logf", "x²", "x³", "xʸ", "2ʸ", "eʸ", "10ʸ", "x!", "x⁻¹", "π", "e", "γ", "φ", "Rand":
            return 35
        case "AC", "±", "%":
            return 50
        default:
            return 45
        }
    }

    func buttonBackgroundColor(for button: String) -> Color {
        switch button {
        case "f1", "f2", "f3", "f4", "f5", "f6":
            return Color.green.opacity(0.2)
        case "÷", "×", "−", "+", "=", "(", ")":
            return Color.gray.opacity(0.6)
        case "sin", "cos", "tan", "lg10", "ln", "logX", "√", "^", "π", "exp", "mod", "inv", "n!", "sinh", "cosh", "tanh", "log2", "asin", "acos", "atan", "ln2", "sinh⁻¹", "cosh⁻¹", "tanh⁻¹", "logf", "x²", "x³", "xʸ", "2ʸ", "eʸ", "10ʸ", "x!", "x⁻¹", "π", "e", "γ", "φ", "Rand":
            return Color.gray.opacity(1.0)
        case "AC", "±", "%", "C", "MR", "M+", "M-", "MRC":
            return Color.black.opacity(0.6)
        default:
            return Color.gray.opacity(0.1)
        }
    }

    func buttonforegroundColor(for button: String) -> Color {
        switch button {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ".":
            return Color.black.opacity(1.0)
        default:
            return Color.white.opacity(1.0)
        }
    }
}

// Extension to NSRegularExpression to use closures for replacement
extension NSRegularExpression {
    func stringByReplacingMatches(in string: String, options: MatchingOptions = [], range: NSRange, using block: (NSTextCheckingResult) -> String) -> String {
        var newString = string
        let matches = self.matches(in: string, options: options, range: range).reversed()

        for match in matches {
            let replacement = block(match)
            let nsrange = match.range
            if let range = Range(nsrange, in: newString) {
                newString.replaceSubrange(range, with: replacement)
            }
        }
        return newString
    }
}

// struct WaveformInputView: View {
//    var body: some View {
//        Text("Waveform Input View")
//    }
// }

struct AdvancedCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedCalculatorView()
            .previewDevice("iPhone 15 Plus")
    }
}

// Add these placeholder views
struct FunctionView: View {
    var body: some View {
        Text("函数视图")
    }
}

struct UnitConversionView: View {
    var body: some View {
        Text("单位换算视图")
    }
}

struct MoreOptionsView: View {
    @State private var isDarkMode = false
    @State private var selectedAngleUnit = 0
    @State private var precision = 2.0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("显示设置")) {
                    Toggle("深色模式", isOn: $isDarkMode)
                    Picker("角度单位", selection: $selectedAngleUnit) {
                        Text("度").tag(0)
                        Text("弧度").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("计算设置")) {
                    VStack {
                        Text("精确度: \(Int(precision)) 位小数")
                        Slider(value: $precision, in: 0 ... 10, step: 1)
                    }
                }

                Section {
                    NavigationLink(destination: Text("历史记录")) {
                        Label("计算历史", systemImage: "clock")
                    }
                    NavigationLink(destination: Text("关于应用")) {
                        Label("关于", systemImage: "info.circle")
                    }
                }
            }
            .navigationTitle("更多选项")
        }
    }
}
