//
//  ButtonStylesView4.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI//-xhx-第7个按钮好看

struct ButtonStylesView4: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Button 1: Solid Gray with White Border
                Button(action: {}) {
                    Text("Button 1")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.gray)
                                .overlay(
                                    Ellipse().stroke(Color.white, lineWidth: 2)
                                )
                        )
                        .foregroundColor(.white)
                }
                
                // Button 2: Black with Inner Shadow
                Button(action: {}) {
                    Text("Button 2")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.black)
                                .shadow(color: .white.opacity(0.2), radius: 10, x: -5, y: -5)
                                .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 3: White with Gray Gradient Border
                Button(action: {}) {
                    Text("Button 3")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.white)
                                .overlay(
                                    Ellipse()
                                        .stroke(
                                            LinearGradient(gradient: Gradient(colors: [.gray, .black]), startPoint: .top, endPoint: .bottom),
                                            lineWidth: 4
                                        )
                                )
                        )
                        .foregroundColor(.black)
                }

                // Button 4: Gray with Dashed Border
                Button(action: {}) {
                    Text("Button 4")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.gray)
                                .overlay(
                                    Ellipse()
                                        .stroke(
                                            Color.black,
                                            style: StrokeStyle(lineWidth: 2, dash: [5])
                                        )
                                )
                        )
                        .foregroundColor(.black)
                }

                // Button 5: Black with Gradient Fill
                Button(action: {}) {
                    Text("Button 5")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .leading, endPoint: .trailing)
                                )
                        )
                        .foregroundColor(.white)
                }

                // Button 6: White with Shadow
                Button(action: {}) {
                    Text("Button 6")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.white)
                                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                        )
                        .foregroundColor(.black)
                }

                // Button 7: Gray with Inset Border and Inner Shadow
                Button(action: {}) {
                    Text("Button 7")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.gray)
                                .overlay(
                                    Ellipse()
                                        .stroke(Color.black, lineWidth: 2)
                                        .offset(x: 2, y: 2)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.white)
                }

                // Button 8: Black with White Border and Double Shadow
                Button(action: {}) {
                    Text("Button 8")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.black)
                                .overlay(
                                    Ellipse().stroke(Color.white, lineWidth: 3)
                                )
                                .shadow(color: .gray.opacity(0.5), radius: 5, x: 5, y: 5)
                                .shadow(color: .black.opacity(0.5), radius: 5, x: -5, y: -5)
                        )
                        .foregroundColor(.white)
                }

                // Button 9: White with Radial Gradient
                Button(action: {}) {
                    Text("Button 9")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(
                                    RadialGradient(gradient: Gradient(colors: [.gray, .white]), center: .center, startRadius: 5, endRadius: 50)
                                )
                        )
                        .foregroundColor(.black)
                }

                // Button 10: Gray with Emboss Effect
                Button(action: {}) {
                    Text("Button 10")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(Color.gray)
                                .shadow(color: .black.opacity(0.8), radius: 5, x: 5, y: 5)
                                .shadow(color: .white.opacity(0.8), radius: 5, x: -5, y: -5)
                        )
                        .foregroundColor(.black)
                }
            }
            .padding()
        }
    }
}

//@main
//struct ButtonStylesApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}

#Preview {
    ButtonStylesView4()
}
