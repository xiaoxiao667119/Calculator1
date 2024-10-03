//
//  ButtonStylesView7.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//
//import SwiftUI//-xhx-这个也能用的
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = []
//    @State private var equation: String = ""
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//    }
//    
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)]
//    
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                // Axes
//                Path { path in
//                    // X-axis
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y-axis
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X-axis ticks and labels
//                ForEach(0..<11) { i in
//                    let x = geometry.size.width / 10 * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(i)")
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y-axis ticks and labels
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - geometry.size.height / 10 * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(i * 2)")
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // Plot data
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    let xScale = geometry.size.width / 10.0
//                    let yScale = geometry.size.height / 20.0
//                    path.move(to: CGPoint(x: firstPoint.x * xScale, y: geometry.size.height - firstPoint.y * yScale))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x * xScale, y: geometry.size.height - point.y * yScale))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//            }
//            .padding()
//        }
//    }
//}

//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = []
//    @State private var equation: String = ""
//    @State private var inputX: String = ""
//    @State private var selectedPoint: (x: Double, y: Double)?
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)]
//    let selectedPoint: (x: Double, y: Double)?
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xMax = data.max(by: { $0.x < $1.x })?.x ?? 10
//            let yMax = data.max(by: { $0.y < $1.y })?.y ?? 10
//            let xScale = geometry.size.width / CGFloat(xMax)
//            let yScale = geometry.size.height / CGFloat(yMax)
//            
//            ZStack {
//                // Axes
//                Path { path in
//                    // X-axis
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y-axis
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X-axis ticks and labels
//                ForEach(0..<Int(xMax + 1)) { i in
//                    let x = geometry.size.width / CGFloat(xMax) * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(i)")
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y-axis ticks and labels
//                ForEach(0..<Int(yMax + 1)) { i in
//                    let y = geometry.size.height - geometry.size.height / CGFloat(yMax) * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(i)")
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // Plot data
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x * xScale, y: geometry.size.height - firstPoint.y * yScale))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x * xScale, y: geometry.size.height - point.y * yScale))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // Highlight selected point
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x * Double(xScale)
//                    let y = geometry.size.height - selectedPoint.y * Double(yScale)
//                    
//                    Path { path in
//                        // Vertical line
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // Horizontal line
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                }
//            }
//            .padding()
//        }
//    }
//}
//

//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = [] // 存储绘图点
//    @State private var equation: String = "" // 存储当前方程
//    @State private var inputX: String = "" // 存储用户输入的x值
//    @State private var selectedPoint: (x: Double, y: Double)? // 存储选中的点
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    // 计算并绘制线性方程 y = 2x + 5
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    // 计算并绘制二次方程 y = 2x^2 + 5
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    // 根据用户输入的x值绘制选中的点
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)] // 数据点
//    let selectedPoint: (x: Double, y: Double)? // 选中的点
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xMax = data.max(by: { $0.x < $1.x })?.x ?? 10
//            let yMax = data.max(by: { $0.y < $1.y })?.y ?? 10
//            let xScale = geometry.size.width / CGFloat(xMax)
//            let yScale = geometry.size.height / CGFloat(yMax)
//            
//            ZStack {
//                // 坐标轴
//                Path { path in
//                    // X轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X轴刻度和标签
//                ForEach(0..<11) { i in
//                    let x = geometry.size.width / 10 * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(Int(xMax) / 10 * i)")
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y轴刻度和标签
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - geometry.size.height / 10 * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text("\(Int(yMax) / 10 * i)")
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // 绘制数据点
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x * xScale, y: geometry.size.height - firstPoint.y * yScale))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x * xScale, y: geometry.size.height - point.y * yScale))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // 高亮选中的点
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x * Double(xScale)
//                    let y = geometry.size.height - selectedPoint.y * Double(yScale)
//                    
//                    Path { path in
//                        // 垂直线
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // 水平线
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = [] // 存储绘图点
//    @State private var equation: String = "" // 存储当前方程
//    @State private var inputX: String = "" // 存储用户输入的x值
//    @State private var selectedPoint: (x: Double, y: Double)? // 存储选中的点
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    // 计算并绘制线性方程 y = 2x + 5
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    // 计算并绘制二次方程 y = 2x^2 + 5
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        selectedPoint = nil
//    }
//    
//    // 根据用户输入的x值绘制选中的点
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)] // 数据点
//    let selectedPoint: (x: Double, y: Double)? // 选中的点
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xMax = data.max(by: { $0.x < $1.x })?.x ?? 10
//            let yMax = data.max(by: { $0.y < $1.y })?.y ?? 10
//            let xScale = geometry.size.width / 10
//            let yScale = geometry.size.height / 10
//            
//            ZStack {
//                // 坐标轴
//                Path { path in
//                    // X轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X轴刻度和标签
//                ForEach(0..<11) { i in
//                    let x = xScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", xMax / 10 * Double(i)))
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y轴刻度和标签
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - yScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", yMax / 10 * Double(i)))
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // 绘制数据点
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x / xMax * geometry.size.width, y: geometry.size.height - firstPoint.y / yMax * geometry.size.height))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x / xMax * geometry.size.width, y: geometry.size.height - point.y / yMax * geometry.size.height))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // 高亮选中的点
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x / xMax * geometry.size.width
//                    let y = geometry.size.height - selectedPoint.y / yMax * geometry.size.height
//                    
//                    Path { path in
//                        // 垂直线
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // 水平线
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                }
//            }
//            .padding()
//        }
//    }
//}

//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = [] // 存储绘图点
//    @State private var equation: String = "" // 存储当前方程
//    @State private var inputX: String = "" // 存储用户输入的x值
//    @State private var selectedPoint: (x: Double, y: Double)? // 存储选中的点
//    @State private var xMax: Double = 10 // X轴最大值
//    @State private var yMax: Double = 10 // Y轴最大值
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint, xMax: xMax, yMax: yMax)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    // 计算并绘制线性方程 y = 2x + 5
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    // 计算并绘制二次方程 y = 2x^2 + 5
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    // 根据用户输入的x值绘制选中的点
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
//        xMax = max(10, xValue * 2)
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)] // 数据点
//    let selectedPoint: (x: Double, y: Double)? // 选中的点
//    let xMax: Double // X轴最大值
//    let yMax: Double // Y轴最大值
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xScale = geometry.size.width / 10
//            let yScale = geometry.size.height / 10
//            
//            ZStack {
//                // 坐标轴
//                Path { path in
//                    // X轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X轴刻度和标签
//                ForEach(0..<11) { i in
//                    let x = xScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", xMax / 10 * Double(i)))
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y轴刻度和标签
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - yScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", yMax / 10 * Double(i)))
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // 绘制数据点
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x / xMax * geometry.size.width, y: geometry.size.height - firstPoint.y / yMax * geometry.size.height))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x / xMax * geometry.size.width, y: geometry.size.height - point.y / yMax * geometry.size.height))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // 高亮选中的点
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x / xMax * geometry.size.width
//                    let y = geometry.size.height - selectedPoint.y / yMax * geometry.size.height
//                    
//                    Path { path in
//                        // 垂直线
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // 水平线
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                    
//                    // 显示交点的红色数值
//                    Text(String(format: "(%.2f, %.2f)", selectedPoint.x, selectedPoint.y))
//                        .foregroundColor(.red)
//                        .position(x: x + 30, y: y - 20)
//                }
//            }
//            .padding()
//        }
//    }
//}



//-xhx-这个快改好了，就差个蓝线显示
import SwiftUI

struct ButtonStylesView7: View {
    @State private var points: [(x: Double, y: Double)] = [] // 存储绘图点
    @State private var equation: String = "" // 存储当前方程
    @State private var inputX: String = "" // 存储用户输入的x值
    @State private var selectedPoint: (x: Double, y: Double)? // 存储选中的点
    @State private var xMax: Double = 10 // X轴最大值
    @State private var yMax: Double = 10 // Y轴最大值
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button(action: calculateAndPlotLinear) {
                    Text("Calculate y=2x+5")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black, lineWidth: 1) // 边框线
                                        .offset(x: 1, y: 1)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.white) // 文字颜色
                }
                
                Button(action: calculateAndPlotQuadratic) {
                    Text("Calculate y=2x^2+5")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black, lineWidth: 1) // 边框线
                                        .offset(x: 1, y: 1)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.white) // 文字颜色
                }
            }
            
            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Text(equation)
                .font(.title)
                .padding()
            
            if !points.isEmpty {
                ChartView(data: points, selectedPoint: selectedPoint, xMax: xMax, yMax: yMax)
                    .frame(height: 300)
                    .padding()
            }
        }
        .padding()
    }
    
    // 计算并绘制线性方程 y = 2x + 5
    func calculateAndPlotLinear() {
        equation = "y = 2x + 5"
        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
            let y = 2 * x + 5
            return (x: x, y: y)
        }
        xMax = 10
        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
        selectedPoint = nil
    }
    
    // 计算并绘制二次方程 y = 2x^2 + 5
    func calculateAndPlotQuadratic() {
        equation = "y = 2x^2 + 5"
        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
            let y = 2 * pow(x, 2) + 5
            return (x: x, y: y)
        }
        xMax = 10
        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
        selectedPoint = nil
    }
    
    // 根据用户输入的x值绘制选中的点
    func plotSelectedPoint() {
        guard let xValue = Double(inputX) else { return }
        if equation == "y = 2x + 5" {
            let yValue = 2 * xValue + 5
            selectedPoint = (x: xValue, y: yValue)
        } else if equation == "y = 2x^2 + 5" {
            let yValue = 2 * pow(xValue, 2) + 5
            selectedPoint = (x: xValue, y: yValue)
        }
//        xMax = max(10, xValue * 2)
        xMax = xValue * Double.random(in: 1.6...1.8)
//        yMax = max(10, selectedPoint?.y ?? 10) * 1.1
        yMax = (selectedPoint?.y ?? 10) * Double.random(in: 1.2...1.4)

        //-xhx-终于自己把这里改好了，现在曲线不会出头了
        var y_xMax: Double = 0
        if equation == "y = 2x + 5" {
            y_xMax = (yMax*1.1 - 5) / 2
        } else if equation == "y = 2x^2 + 5" {
            y_xMax = sqrt((yMax*1.1 - 5) / 2)
        }
        let xMax1 = min(xMax, y_xMax)
        points = stride(from: 0.0, to: xMax1, by: 0.1).map { x in
                    let y: Double
                    if equation == "y = 2x + 5" {
                        y = 2 * x + 5
                    } else {
                        y = 2 * pow(x, 2) + 5
                    }
                    return (x: x, y: y)
                }
        
    }
}

struct ChartView: View {
    let data: [(x: Double, y: Double)] // 数据点
    let selectedPoint: (x: Double, y: Double)? // 选中的点
    let xMax: Double // X轴最大值
    let yMax: Double // Y轴最大值
    
    var body: some View {
        GeometryReader { geometry in
            let xScale = geometry.size.width / 10
            let yScale = geometry.size.height / 10
            
            ZStack {
                // 坐标轴
                Path { path in
                    // X轴
                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                    
                    // Y轴
                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                }
                .stroke(Color.black, lineWidth: 2)
                
                // X轴刻度和标签
                ForEach(0..<11) { i in
                    let x = xScale * CGFloat(i)
                    Path { path in
                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
                    }
                    .stroke(Color.black, lineWidth: 1)
                    
                    Text(String(format: "%.1f", xMax / 10 * Double(i)))
                        .position(x: x, y: geometry.size.height + 20)
                        .font(.caption)
                }
                
                // Y轴刻度和标签
                ForEach(0..<11) { i in
                    let y = geometry.size.height - yScale * CGFloat(i)
                    Path { path in
                        path.move(to: CGPoint(x: -5, y: y))
                        path.addLine(to: CGPoint(x: 5, y: y))
                    }
                    .stroke(Color.black, lineWidth: 1)
                    
                    Text(String(format: "%.1f", yMax / 10 * Double(i)))
                        .position(x: -20, y: y)
                        .font(.caption)
                }
                
                // 绘制数据点
                Path { path in
                    guard let firstPoint = data.first else { return }
                    path.move(to: CGPoint(x: firstPoint.x / xMax * geometry.size.width, y: geometry.size.height - firstPoint.y / yMax * geometry.size.height))
                    
                    for point in data.dropFirst() {
                        path.addLine(to: CGPoint(x: point.x / xMax * geometry.size.width, y: geometry.size.height - point.y / yMax * geometry.size.height))
                    }
                }
                .stroke(Color.blue, lineWidth: 2)

                
                // 高亮选中的点
                if let selectedPoint = selectedPoint {
                    let x = selectedPoint.x / xMax * geometry.size.width
                    let y = geometry.size.height - selectedPoint.y / yMax * geometry.size.height
                    
                    Path { path in
                        // 垂直线
                        path.move(to: CGPoint(x: x, y: geometry.size.height))
                        path.addLine(to: CGPoint(x: x, y: y))
                        
                        // 水平线
                        path.move(to: CGPoint(x: 0, y: y))
                        path.addLine(to: CGPoint(x: x, y: y))
                    }
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 6, height: 6)
                        .position(x: x, y: y)
                    
                    // 显示交点的红色数值
                    Text(String(format: "(%.2f, %.2f)", selectedPoint.x, selectedPoint.y))
                        .foregroundColor(.red)
                        .position(x: x + 30, y: y - 20)
                }
            }
            .padding()
        }
    }
}



//
//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = [] // 存储绘图点
//    @State private var equation: String = "" // 存储当前方程
//    @State private var inputX: String = "" // 存储用户输入的x值
//    @State private var selectedPoint: (x: Double, y: Double)? // 存储选中的点
//    @State private var xMax: Double = 10 // X轴最大值
//    @State private var yMax: Double = 10 // Y轴最大值
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3)) // 浅灰色填充
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1) // 边框线
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white) // 文字颜色
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint, xMax: xMax, yMax: yMax)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    // 计算并绘制线性方程 y = 2x + 5
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    // 计算并绘制二次方程 y = 2x^2 + 5
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    // 根据用户输入的x值绘制选中的点
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
//        xMax = max(10, xValue * 2)
//        yMax = max(10, selectedPoint?.y ?? 10) * 1.1
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)] // 数据点
//    let selectedPoint: (x: Double, y: Double)? // 选中的点
//    let xMax: Double // X轴最大值
//    let yMax: Double // Y轴最大值
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xScale = geometry.size.width / CGFloat(xMax)
//            let yScale = geometry.size.height / CGFloat(yMax)
//            
//            ZStack {
//                // 坐标轴
//                Path { path in
//                    // X轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X轴刻度和标签
//                ForEach(0..<11) { i in
//                    let x = xScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", xMax / 10 * Double(i)))
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y轴刻度和标签
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - yScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", yMax / 10 * Double(i)))
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // 绘制数据点
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x / xMax * geometry.size.width, y: geometry.size.height - firstPoint.y / yMax * geometry.size.height))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x / xMax * geometry.size.width, y: geometry.size.height - point.y / yMax * geometry.size.height))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // 高亮选中的点
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x / xMax * geometry.size.width
//                    let y = geometry.size.height - selectedPoint.y / yMax * geometry.size.height
//                    
//                    Path { path in
//                        // 垂直线
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // 水平线
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                    
//                    // 显示交点的红色数值
//                    Text(String(format: "(%.2f, %.2f)", selectedPoint.x, selectedPoint.y))
//                        .foregroundColor(.red)
//                        .position(x: x + 30, y: y - 20)
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//import SwiftUI
//
//struct ButtonStylesView7: View {
//    @State private var points: [(x: Double, y: Double)] = []
//    @State private var equation: String = ""
//    @State private var inputX: String = ""
//    @State private var selectedPoint: (x: Double, y: Double)?
//    @State private var xMax: Double = 10
//    @State private var yMax: Double = 10
//    
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                Button(action: calculateAndPlotLinear) {
//                    Text("Calculate y=2x+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1)
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white)
//                }
//                
//                Button(action: calculateAndPlotQuadratic) {
//                    Text("Calculate y=2x^2+5")
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 15)
//                                .fill(Color.gray.opacity(0.3))
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 15)
//                                        .stroke(Color.black, lineWidth: 1)
//                                        .offset(x: 1, y: 1)
//                                )
//                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
//                        )
//                        .foregroundColor(.white)
//                }
//            }
//            
//            TextField("Enter x value", text: $inputX, onCommit: plotSelectedPoint)
//                .padding()
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .keyboardType(.decimalPad)
//            
//            Text(equation)
//                .font(.title)
//                .padding()
//            
//            if !points.isEmpty {
//                ChartView(data: points, selectedPoint: selectedPoint, xMax: xMax, yMax: yMax)
//                    .frame(height: 300)
//                    .padding()
//            }
//        }
//        .padding()
//    }
//    
//    func calculateAndPlotLinear() {
//        equation = "y = 2x + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * x + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    func calculateAndPlotQuadratic() {
//        equation = "y = 2x^2 + 5"
//        points = stride(from: 0.0, to: 10.0, by: 0.1).map { x in
//            let y = 2 * pow(x, 2) + 5
//            return (x: x, y: y)
//        }
//        xMax = 10
//        yMax = (points.max(by: { $0.y < $1.y })?.y ?? 10) * 1.1
//        selectedPoint = nil
//    }
//    
//    func plotSelectedPoint() {
//        guard let xValue = Double(inputX) else { return }
//        if equation == "y = 2x + 5" {
//            let yValue = 2 * xValue + 5
//            selectedPoint = (x: xValue, y: yValue)
//        } else if equation == "y = 2x^2 + 5" {
//            let yValue = 2 * pow(xValue, 2) + 5
//            selectedPoint = (x: xValue, y: yValue)
//        }
////        xMax = max(10, xValue * 2)
//        xMax = xValue * 2
////        yMax = max(10, (selectedPoint?.y ?? 10) * 2)
//        yMax = (selectedPoint?.y ?? 10) * 2
//        points = stride(from: 0.0, to: xMax, by: 0.1).map { x in
//            let y: Double
//            if equation == "y = 2x + 5" {
//                y = 2 * x + 5
//            } else {
//                y = 2 * pow(x, 2) + 5
//            }
//            return (x: x, y: y)
//        }
//    }
//}
//
//struct ChartView: View {
//    let data: [(x: Double, y: Double)]
//    let selectedPoint: (x: Double, y: Double)?
//    let xMax: Double
//    let yMax: Double
//    
//    var body: some View {
//        GeometryReader { geometry in
//            let xScale = geometry.size.width / CGFloat(xMax)
//            let yScale = geometry.size.height / CGFloat(yMax)
//            
//            ZStack {
//                // 坐标轴
//                Path { path in
//                    // X轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
//                    
//                    // Y轴
//                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
//                    path.addLine(to: CGPoint(x: 0, y: 0))
//                }
//                .stroke(Color.black, lineWidth: 2)
//                
//                // X轴刻度和标签
//                ForEach(0..<11) { i in
//                    let x = xScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: x, y: geometry.size.height - 5))
//                        path.addLine(to: CGPoint(x: x, y: geometry.size.height + 5))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", xMax / 10 * Double(i)))
//                        .position(x: x, y: geometry.size.height + 20)
//                        .font(.caption)
//                }
//                
//                // Y轴刻度和标签
//                ForEach(0..<11) { i in
//                    let y = geometry.size.height - yScale * CGFloat(i)
//                    Path { path in
//                        path.move(to: CGPoint(x: -5, y: y))
//                        path.addLine(to: CGPoint(x: 5, y: y))
//                    }
//                    .stroke(Color.black, lineWidth: 1)
//                    
//                    Text(String(format: "%.1f", yMax / 10 * Double(i)))
//                        .position(x: -20, y: y)
//                        .font(.caption)
//                }
//                
//                // 绘制数据点
//                Path { path in
//                    guard let firstPoint = data.first else { return }
//                    path.move(to: CGPoint(x: firstPoint.x / xMax * geometry.size.width, y: geometry.size.height - firstPoint.y / yMax * geometry.size.height))
//                    
//                    for point in data.dropFirst() {
//                        path.addLine(to: CGPoint(x: point.x / xMax * geometry.size.width, y: geometry.size.height - point.y / yMax * geometry.size.height))
//                    }
//                }
//                .stroke(Color.blue, lineWidth: 2)
//                
//                // 高亮选中的点
//                if let selectedPoint = selectedPoint {
//                    let x = selectedPoint.x / xMax * geometry.size.width
//                    let y = geometry.size.height - selectedPoint.y / yMax * geometry.size.height
//                    
//                    Path { path in
//                        // 垂直线
//                        path.move(to: CGPoint(x: x, y: geometry.size.height))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                        
//                        // 水平线
//                        path.move(to: CGPoint(x: 0, y: y))
//                        path.addLine(to: CGPoint(x: x, y: y))
//                    }
//                    .stroke(Color.red, style: StrokeStyle(lineWidth: 1, dash: [5, 5]))
//                    
//                    Circle()
//                        .fill(Color.red)
//                        .frame(width: 6, height: 6)
//                        .position(x: x, y: y)
//                    
//                    // 显示交点的红色数值
//                    Text(String(format: "(%.2f, %.2f)", selectedPoint.x, selectedPoint.y))
//                        .foregroundColor(.red)
//                        .position(x: x + 30, y: y - 20)
//                }
//            }
//            .padding()
//        }
//    }
//}
//


#Preview {
    ButtonStylesView7()
}
