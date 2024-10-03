//
//  jidianqi1UIView.swift
//  Calculator
//
//  Created by JZ P on 2024/7/25.
//
/*
import SwiftUI

struct RelayCircuitView: View {
    @State private var isRelayActive = false
    
    var body: some View {
        VStack(spacing: 20) {
            RelayView(isActive: $isRelayActive)
            LampView(isOn: isRelayActive)
            Button(action: {
                isRelayActive.toggle()
            }) {
                Text(isRelayActive ? "关闭继电器" : "打开继电器")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct RelayView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Text("继电器")
                .font(.largeTitle)
            Circle()
                .fill(isActive ? Color.green : Color.red)
                .frame(width: 100, height: 100)
                .overlay(
                    Text(isActive ? "ON" : "OFF")
                        .foregroundColor(.white)
                        .font(.title)
                )
        }
    }
}

struct LampView: View {
    var isOn: Bool
    
    var body: some View {
        VStack {
            Text("灯泡")
                .font(.largeTitle)
            Circle()
                .fill(isOn ? Color.yellow : Color.gray)
                .frame(width: 100, height: 100)
                .overlay(
                    Text(isOn ? "亮" : "灭")
                        .foregroundColor(.black)
                        .font(.title)
                )
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        RelayCircuitView()
//    }
//}

//@main
//struct RelayCircuitApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
*/
import SwiftUI

struct RelayCircuitView: View {
    @State private var isRelayActive = false
    
    var body: some View {
        VStack(spacing: 20) {
            CircuitDiagramView(isRelayActive: $isRelayActive)
            Button(action: {
                isRelayActive.toggle()
            }) {
                Text(isRelayActive ? "关闭继电器" : "打开继电器")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct CircuitDiagramView: View {
    @Binding var isRelayActive: Bool
    
    var body: some View {
        VStack {
            Text("直流二次回路图")
                .font(.title)
            
            ZStack {
                CircuitDiagramShape()
                    .stroke(Color.black, lineWidth: 2)
                
                if isRelayActive {
                    CircuitRelayActiveShape()
                        .stroke(Color.green, lineWidth: 2)
                } else {
                    CircuitRelayInactiveShape()
                        .stroke(Color.red, lineWidth: 2)
                }
                
                LampView(isOn: isRelayActive)
                    .position(x: 300, y: 100)
                
                RelayView(isActive: $isRelayActive)
                    .position(x: 150, y: 100)
            }
            .frame(width: 350, height: 200)
        }
    }
}

struct CircuitDiagramShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 电源到继电器
        path.move(to: CGPoint(x: 50, y: 100))
        path.addLine(to: CGPoint(x: 150, y: 100))
        
        // 继电器到灯泡
        path.move(to: CGPoint(x: 200, y: 100))
        path.addLine(to: CGPoint(x: 300, y: 100))
        
        // 灯泡回到电源
        path.move(to: CGPoint(x: 300, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 150))
        path.addLine(to: CGPoint(x: 50, y: 100))
        
        return path
    }
}

struct CircuitRelayActiveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 继电器接通
        path.move(to: CGPoint(x: 150, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 100))
        
        return path
    }
}

struct CircuitRelayInactiveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // 继电器断开
        path.move(to: CGPoint(x: 150, y: 90))
        path.addLine(to: CGPoint(x: 200, y: 110))
        
        return path
    }
}

struct RelayView: View {
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            Text("继电器")
                .font(.headline)
            Circle()
                .fill(isActive ? Color.green : Color.red)
                .frame(width: 50, height: 50)
                .overlay(
                    Text(isActive ? "ON" : "OFF")
                        .foregroundColor(.white)
                        .font(.caption)
                )
        }
    }
}

struct LampView: View {
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

//struct ContentView: View {
//    var body: some View {
//        RelayCircuitView()
//    }
//}
//
//@main
//struct RelayCircuitApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

#Preview {
    RelayCircuitView()
}
