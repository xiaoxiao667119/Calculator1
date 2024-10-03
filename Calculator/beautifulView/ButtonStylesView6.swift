//
//  ButtonStylesView6.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI

struct ButtonStylesView6: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Button 1: Gray with Inner Shadow and Border
                Button(action: {}) {
                    Text("Button 1")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                        .offset(x: 2, y: 2)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.white)
                }
                
                // Button 2: Black with Light Inner Shadow
                Button(action: {}) {
                    Text("Button 2")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                                .shadow(color: .white.opacity(0.2), radius: 10, x: -5, y: -5)
                                .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 3: Light Gray with Double Shadow
                Button(action: {}) {
                    Text("Button 3")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                                .shadow(color: .white.opacity(0.5), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.black)
                }

                // Button 4: Dark Gray with Gradient Border
                Button(action: {}) {
                    Text("Button 4")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .leading, endPoint: .trailing),
                                            lineWidth: 2
                                        )
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 5: Black with Inner Gradient
                Button(action: {}) {
                    Text("Button 5")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                                )
                                .shadow(color: .white.opacity(0.2), radius: 10, x: -5, y: -5)
                                .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 6: White with Gradient Fill and Border
                Button(action: {}) {
                    Text("Button 6")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .top, endPoint: .bottom),
                                            lineWidth: 4
                                        )
                                )
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.black)
                }

                // Button 7: Light Gray with Dashed Border and Shadow
                Button(action: {}) {
                    Text("Button 7")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, style: StrokeStyle(lineWidth: 2, dash: [5]))
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.black)
                }

                // Button 8: White with Radial Gradient
                Button(action: {}) {
                    Text("Button 8")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    RadialGradient(gradient: Gradient(colors: [Color.gray, Color.white]), center: .center, startRadius: 5, endRadius: 50)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.black)
                }

                // Button 9: Gray with Inset Border and Shadow
                Button(action: {}) {
                    Text("Button 9")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                        .padding(2)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                        .padding(4)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.black)
                }

                // Button 10: Dark Gray with Outer Shadow and Border
                Button(action: {}) {
                    Text("Button 10")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
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
    ButtonStylesView6()
}
