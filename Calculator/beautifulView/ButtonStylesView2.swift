//
//  ButtonStylesView2.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI


struct ButtonStylesView2: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Button 1: 3D Effect with Gradient and Shadow
                Button(action: {}) {
                    Text("Button 1")
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(15)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }

                // Button 2: Circle with Inner Shadow
                Button(action: {}) {
                    Text("Button 2")
                        .padding()
                        .background(Circle().fill(Color.red))
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
                        .overlay(
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                        )
                }

                // Button 3: Capsule with Gradient Border
                Button(action: {}) {
                    Text("Button 3")
                        .padding()
                        .background(Capsule().stroke(LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .leading, endPoint: .trailing), lineWidth: 5))
                        .foregroundColor(.black)
                }

                // Button 4: Rounded Rectangle with Light and Shadow
                Button(action: {}) {
                    Text("Button 4")
                        .padding()
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.orange)
                                    .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.5), Color.clear]), startPoint: .top, endPoint: .bottom))
                            }
                        )
                        .foregroundColor(.white)
                }

                // Button 5: Ellipse with Gradient and Shadow
                Button(action: {}) {
                    Text("Button 5")
                        .padding()
                        .background(
                            Ellipse()
                                .fill(LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .leading, endPoint: .trailing))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 6: Square with Image Background
                Button(action: {}) {
                    Text("Button 6")
                        .padding()
                        .background(
                            Image("background")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                        )
                        .foregroundColor(.white)
                }

                // Button 7: Hexagon with Solid Background and Shadow
                Button(action: {}) {
                    Text("Button 7")
                        .padding()
                        .background(
                            HexagonShape2()
                                .fill(Color.green)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 8: Star with Gradient Fill and Shadow
                Button(action: {}) {
                    Text("Button 8")
                        .padding()
                        .background(
                            StarShape2()
                                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .orange]), startPoint: .top, endPoint: .bottom))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 9: Pentagon with Gradient Border and Shadow
                Button(action: {}) {
                    Text("Button 9")
                        .padding()
                        .background(
                            PentagonShape2()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .leading, endPoint: .trailing), lineWidth: 5)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                        .foregroundColor(.black)
                }

                // Button 10: Rounded Rectangle with Dashed Border and Shadow
                Button(action: {}) {
                    Text("Button 10")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                }

                // Button 11: Circle with Radial Gradient and Inner Shadow
                Button(action: {}) {
                    Text("Button 11")
                        .padding()
                        .background(
                            Circle()
                                .fill(RadialGradient(gradient: Gradient(colors: [.purple, .blue]), center: .center, startRadius: 5, endRadius: 50))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 12: Rectangle with Image and Text Overlay
                Button(action: {}) {
                    ZStack {
                        Image("background2")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 50)
                            .clipped()
                            .cornerRadius(10)
                            .overlay(
                                Rectangle()
                                    .fill(Color.black.opacity(0.3))
                                    .cornerRadius(10)
                            )
                        Text("Button 12")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Rectangle().fill(Color.clear))
                }

                // Button 13: Capsule with Gradient, Border and Shadow
                Button(action: {}) {
                    Text("Button 13")
                        .padding()
                        .background(
                            Capsule()
                                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .leading, endPoint: .trailing))
                                .overlay(
                                    Capsule()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 14: Square with Corner Radius, Gradient Border and Shadow
                Button(action: {}) {
                    Text("Button 14")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(
                                    LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom),
                                    lineWidth: 3
                                )
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                }

                // Button 15: Circle with Image and Text Overlay
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 100, height: 100)
                            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        VStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                            Text("Button 15")
                                .foregroundColor(.white)
                        }
                    }
                }

                // Button 16: Star with Radial Gradient and Shadow
                Button(action: {}) {
                    Text("Button 16")
                        .padding()
                        .background(
                            StarShape2()
                                .fill(RadialGradient(gradient: Gradient(colors: [.yellow, .orange]), center: .center, startRadius: 5, endRadius: 50))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 17: Rounded Rectangle with Gradient and Shadow
                Button(action: {}) {
                    Text("Button 17")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .top, endPoint: .bottom))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.white)
                }

                // Button 18: Hexagon with Gradient Border and Shadow
                Button(action: {}) {
                    Text("Button 18")
                        .padding()
                        .background(
                            HexagonShape2()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing), lineWidth: 3)
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                        .foregroundColor(.black)
                }

                // Button 19: Circle with Border, Gradient and Shadow
                Button(action: {}) {
                    Text("Button 19")
                        .padding()
                        .background(
                            Circle()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .top, endPoint: .bottom), lineWidth: 3)
                                .background(Circle().fill(Color.white))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
                        )
                        .foregroundColor(.purple)
                }

                // Button 20: Ellipse with Gradient and Dashed Border
                Button(action: {}) {
                    Text("Button 20")
                        .padding()
                        .background(
                            Ellipse()
                                .stroke(LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
                        )
                }
            }
            .padding()
        }
    }
}

// Custom Shapes
struct HexagonShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: width, y: height * 0.25))
        path.addLine(to: CGPoint(x: width, y: height * 0.75))
        path.addLine(to: CGPoint(x: width * 0.5, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * 0.75))
        path.addLine(to: CGPoint(x: 0, y: height * 0.25))
        path.closeSubpath()
        return path
    }
}

struct StarShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: width * 0.617, y: height * 0.346))
        path.addLine(to: CGPoint(x: width, y: height * 0.382))
        path.addLine(to: CGPoint(x: width * 0.691, y: height * 0.618))
        path.addLine(to: CGPoint(x: width * 0.782, y: height))
        path.addLine(to: CGPoint(x: width * 0.5, y: height * 0.791))
        path.addLine(to: CGPoint(x: width * 0.218, y: height))
        path.addLine(to: CGPoint(x: width * 0.309, y: height * 0.618))
        path.addLine(to: CGPoint(x: 0, y: height * 0.382))
        path.addLine(to: CGPoint(x: width * 0.383, y: height * 0.346))
        path.closeSubpath()
        
        return path
    }
}

struct PentagonShape2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: width, y: height * 0.4))
        path.addLine(to: CGPoint(x: width * 0.8, y: height))
        path.addLine(to: CGPoint(x: width * 0.2, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * 0.4))
        path.closeSubpath()
        return path
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
    ButtonStylesView2()
}
