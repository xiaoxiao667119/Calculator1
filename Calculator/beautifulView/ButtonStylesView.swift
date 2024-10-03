//
//  ButtonStylesView.swift
//  Calculator
//
//  Created by JZ P on 2024/7/28.
//

import SwiftUI



struct ButtonStylesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Button 1: Rounded Rectangle with gradient background
                Button(action: {}) {
                    Text("Button 1")
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                }

                // Button 2: Circle with solid background
                Button(action: {}) {
                    Text("Button 2")
                        .padding()
                        .background(Circle().fill(Color.blue))
                        .foregroundColor(.white)
                }

                // Button 3: Capsule with border
                Button(action: {}) {
                    Text("Button 3")
                        .padding()
                        .background(Capsule().stroke(Color.green, lineWidth: 3))
                }

                // Button 4: Rounded rectangle with shadow
                Button(action: {}) {
                    Text("Button 4")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple).shadow(radius: 10))
                        .foregroundColor(.white)
                }

                // Button 5: Ellipse with gradient border
                Button(action: {}) {
                    Text("Button 5")
                        .padding()
                        .background(Ellipse().stroke(LinearGradient(gradient: Gradient(colors: [.pink, .yellow]), startPoint: .leading, endPoint: .trailing), lineWidth: 5))
                }

                // Button 6: Square with image background
                Button(action: {}) {
                    Text("Button 6")
                        .padding()
                        .background(
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .clipped()
                        )
                        .foregroundColor(.white)
                }

                // Button 7: Hexagon with solid background
                Button(action: {}) {
                    Text("Button 7")
                        .padding()
                        .background(HexagonShape().fill(Color.orange))
                        .foregroundColor(.white)
                }

                // Button 8: Star with gradient fill
                Button(action: {}) {
                    Text("Button 8")
                        .padding()
                        .background(StarShape().fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .top, endPoint: .bottom)))
                        .foregroundColor(.white)
                }

                // Button 9: Pentagon with border
                Button(action: {}) {
                    Text("Button 9")
                        .padding()
                        .background(PentagonShape().stroke(Color.red, lineWidth: 3))
                }

                // Button 10: Rounded rectangle with dashed border
                Button(action: {}) {
                    Text("Button 10")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black, style: StrokeStyle(lineWidth: 2, dash: [5])))
                }

                // Button 11: Circle with radial gradient
                Button(action: {}) {
                    Text("Button 11")
                        .padding()
                        .background(Circle().fill(RadialGradient(gradient: Gradient(colors: [.yellow, .red]), center: .center, startRadius: 5, endRadius: 50)))
                        .foregroundColor(.white)
                }

                // Button 12: Rectangle with image and text overlay
                Button(action: {}) {
                    ZStack {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 50)
                            .clipped()
                        Text("Button 12")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Rectangle().fill(Color.clear))
                }

                // Button 13: Capsule with gradient and shadow
                Button(action: {}) {
                    Text("Button 13")
                        .padding()
                        .background(Capsule().fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing)).shadow(radius: 5))
                        .foregroundColor(.white)
                }

                // Button 14: Square with corner radius and gradient border
                Button(action: {}) {
                    Text("Button 14")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .strokeBorder(
                                    LinearGradient(gradient: Gradient(colors: [.green, .yellow]), startPoint: .top, endPoint: .bottom),
                                    lineWidth: 3
                                )
                        )
                }

                // Button 15: Circle with image and text overlay
                Button(action: {}) {
                    ZStack {
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 100, height: 100)
                        VStack {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.white)
                            Text("Button 15")
                                .foregroundColor(.white)
                        }
                    }
                }

                // Button 16: Star with radial gradient
                Button(action: {}) {
                    Text("Button 16")
                        .padding()
                        .background(StarShape().fill(RadialGradient(gradient: Gradient(colors: [.red, .purple]), center: .center, startRadius: 5, endRadius: 50)))
                        .foregroundColor(.white)
                }

                // Button 17: Rounded rectangle with gradient and shadow
                Button(action: {}) {
                    Text("Button 17")
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 20).fill(LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom)).shadow(radius: 5))
                        .foregroundColor(.white)
                }

                // Button 18: Hexagon with gradient border
                Button(action: {}) {
                    Text("Button 18")
                        .padding()
                        .background(HexagonShape().stroke(LinearGradient(gradient: Gradient(colors: [.blue, .cyan]), startPoint: .leading, endPoint: .trailing), lineWidth: 3))
                }

                // Button 19: Circle with border and shadow
                Button(action: {}) {
                    Text("Button 19")
                        .padding()
                        .background(Circle().stroke(Color.purple, lineWidth: 3).shadow(radius: 5))
                        .foregroundColor(.purple)
                }

                // Button 20: Ellipse with gradient and dashed border
                Button(action: {}) {
                    Text("Button 20")
                        .padding()
                        .background(Ellipse().stroke(LinearGradient(gradient: Gradient(colors: [.pink, .orange]), startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2, dash: [5])))
                }
            }
            .padding()
        }
    }
}

// Custom Shapes
struct HexagonShape: Shape {
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

struct StarShape: Shape {
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

struct PentagonShape: Shape {
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
    ButtonStylesView()
}
import SwiftUI
