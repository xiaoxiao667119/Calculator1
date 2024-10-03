//
//  CircuitDiagramView.swift
//  Calculator
//
//  Created by JZ P on 2024/7/25.
//
import SwiftUI

struct CircuitDiagramView2: View {
    @State private var isSwitchOn = false
    @State private var linePosition = CGPoint(x: 200, y: 150)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("电路图")
                .font(.title)
            
            ZStack {
                CircuitShape(linePosition: $linePosition, isSwitchOn: isSwitchOn)
                    .stroke(Color.black, lineWidth: 2)
                
                BatteryView()
                    .position(x: 50, y: 150)
                
                SwitchView(isOn: $isSwitchOn)
                    .position(x: 150, y: 150)
                
                LampView2(isOn: isSwitchOn)
                    .position(x: 350, y: 150)
                
                LineDragHandle(linePosition: $linePosition)
                    .position(linePosition)
            }
            .frame(width: 400, height: 300)
        }
        .padding()
    }
}

struct CircuitShape: Shape {
    @Binding var linePosition: CGPoint
    var isSwitchOn: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 电池到开关
        path.move(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 100, y: 150))
        
        // 开关到拖动点
        path.move(to: CGPoint(x: 200, y: 150))
        path.addLine(to: linePosition)
        
        // 拖动点到灯泡
        if isSwitchOn {
            path.addLine(to: CGPoint(x: 300, y: 150))
            path.move(to: CGPoint(x: 300, y: 150))
            path.addLine(to: CGPoint(x: 350, y: 150))
        }
        
        // 灯泡回到电池
        path.move(to: CGPoint(x: 350, y: 150))
        path.addLine(to: CGPoint(x: 400, y: 150))
        
        return path
    }
}

struct BatteryView: View {
    var body: some View {
        VStack {
            Text("电池")
                .font(.headline)
            Rectangle()
                .fill(Color.gray)
                .frame(width: 30, height: 60)
        }
    }
}

struct SwitchView: View {
    @Binding var isOn: Bool
    
    var body: some View {
        VStack {
            Text("开关")
                .font(.headline)
            Rectangle()
                .fill(isOn ? Color.green : Color.red)
                .frame(width: 30, height: 30)
                .onTapGesture {
                    isOn.toggle()
                }
        }
    }
}

struct LampView2: View {
    var isOn: Bool
    
    var body: some View {
        VStack {
            Text("灯泡")
                .font(.headline)
            Circle()
                .fill(isOn ? Color.yellow : Color.gray)
                .frame(width: 50, height: 50)
                .overlay(
                    Text(isOn ? "亮" : "灭")
                        .foregroundColor(.black)
                        .font(.caption)
                )
        }
    }
}

struct LineDragHandle: View {
    @Binding var linePosition: CGPoint
    
    var body: some View {
        Circle()
            .fill(Color.blue)
            .frame(width: 20, height: 20)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        linePosition = value.location
                    }
            )
    }
}

//struct ContentView: View {
//    var body: some View {
//        CircuitDiagramView()
//    }
//}
//
//@main
//struct CircuitDiagramApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


#Preview {
    CircuitDiagramView2()
}
