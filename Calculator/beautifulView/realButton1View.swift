import SwiftUI

struct realButton1View: View {
    @State private var isPressed = false

    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                Text("计算器")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 30)
                
                VStack(spacing: 10) {
                    ForEach(0..<4) { row in
                        HStack(spacing: 10) {
                            ForEach(0..<3) { col in
                                let label = "\(row * 3 + col + 1)"
                                Button(action: {
                                    // 按钮点击操作
                                }) {
                                    Text(label)
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 80)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.gray)
                                                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                                                    .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.gray.opacity(isPressed ? 0.8 : 1.0))
                                                    .blur(radius: isPressed ? 2 : 0)
                                            }
                                        )
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
                            }
                        }
                    }
                }

                Spacer()
            }
            .navigationTitle("主界面")
        }
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: isPressed)
    }
}

struct realButton1View_Previews: PreviewProvider {
    static var previews: some View {
        realButton1View()
    }
}
