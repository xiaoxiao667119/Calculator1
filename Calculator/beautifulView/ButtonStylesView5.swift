//
//  ButtonStylesView5.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI

struct ButtonStylesView5: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Button 1: Gray with Inner Shadow and Border
                Button(action: {}) {
                    Text("Button 1")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)//-xhx-这里的10和下面的10改成别的数字且一样，改倒角
                                .fill(Color.gray)//-xhx-改填充色
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(Color.black, lineWidth: 1)//-xhx-2这个数值改边框线细，和下面两个数字保持相等
                                        .offset(x: 1, y: 1)
                                )
                                .shadow(color: .black.opacity(0.2), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.white)//-xhx-改文字色
                }
                
                // Button 2: Dark Gray with Outer Shadow and Inner Gradient
                Button(action: {}) {
                    Text("Button 2")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 3: Light Gray with Double Shadow and Gradient Border
                Button(action: {}) {
                    Text("Button 3")
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
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
                                .shadow(color: .white.opacity(0.5), radius: 10, x: -5, y: -5)
                        )
                        .foregroundColor(.black)
                }

                // Button 4: White with Inner Shadow and Dashed Border
                Button(action: {}) {
                    Text("Button 4")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, style: StrokeStyle(lineWidth: 2, dash: [5]))
                                )
                                .shadow(color: .gray, radius: 10, x: 0, y: 10)
                        )
                        .foregroundColor(.black)
                }

                // Button 5: Black with Radial Gradient and Inner Shadow
                Button(action: {}) {
                    Text("Button 5")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    RadialGradient(gradient: Gradient(colors: [Color.black, Color.gray]), center: .center, startRadius: 5, endRadius: 50)
                                )
                                .shadow(color: .white.opacity(0.2), radius: 10, x: -5, y: -5)
                                .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 6: White with Gradient Border and Shadow
                Button(action: {}) {
                    Text("Button 6")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
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

                // Button 7: Gray with Double Border and Inner Shadow
                Button(action: {}) {
                    Text("Button 7")
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

                // Button 8: Dark Gray with Inner Gradient and Outer Shadow
                Button(action: {}) {
                    Text("Button 8")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.gray, Color.black]), startPoint: .leading, endPoint: .trailing)
                                )
                                .shadow(color: .black.opacity(0.5), radius: 10, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 9: White with Inner Gradient and Border
                Button(action: {}) {
                    Text("Button 9")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .leading, endPoint: .trailing)
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 2)
                                )
                        )
                        .foregroundColor(.black)
                }

                // Button 10: Light Gray with Double Shadow and Border
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
                                .shadow(color: .white.opacity(0.5), radius: 10, x: -5, y: -5)
                                .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 5)
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
    ButtonStylesView5()
}
