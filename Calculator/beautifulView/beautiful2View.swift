//
//  beautiful2View.swift
//  Calculator
//
//  Created by JZ P on 2024/7/1.
//

import SwiftUI

struct beautiful2View: View {
    @State private var isPressed = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    Text("切换界面")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            ZStack {
                                if isPressed {
                                    Color.white.opacity(0.2)
                                        .clipShape(Circle())
                                        .blur(radius: 10)
                                }
                                LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .cornerRadius(25)
                                    .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 10)
                                Circle()
                                    .strokeBorder(Color.white.opacity(0.5), lineWidth: 4)
                                    .blur(radius: 4)
                                    .offset(x: isPressed ? -8 : 8, y: isPressed ? -8 : 8)
                                    .blendMode(.overlay)
                                    .animation(.easeInOut(duration: 0.3))
                            }
                        )
                        .scaleEffect(isPressed ? 1.2 : 1)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3))
                }
                .buttonStyle(PlainButtonStyle())
                .gesture(DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isPressed = true
                        }
                    }
                    .onEnded { _ in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isPressed = false
                        }
                    }
                )
            }
            .navigationTitle("主界面")
        }
    }
}

struct beautiful2View_Previews: PreviewProvider {
    static var previews: some View {
        beautiful2View()
    }
}

//-xhx-1 想用下面的代码就必须将该文件放在最外面的文件夹
//#Preview {
//    beautiful2View()
//}
