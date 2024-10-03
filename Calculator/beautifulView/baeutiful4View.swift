import SwiftUI

struct baeutiful4View: View {
    @State private var isPressed = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 300, height: 70)
                            .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 10)
                        
                        Text("切换界面")
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .fill(Color.black.opacity(0.2))
                                    .blur(radius: 10)
                            )
                        
                        if isPressed {
                            Circle()
                                .strokeBorder(Color.white.opacity(0.5), lineWidth: 4)
                                .blur(radius: 6)
                                .offset(x: 0, y: 0)
                                .scaleEffect(1.5)
                                .blendMode(.overlay)
                        }
                    }
                    .scaleEffect(isPressed ? 1.1 : 1)
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
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3), value: isPressed)
    }
}

struct baeutiful4View_Previews: PreviewProvider {
    static var previews: some View {
        baeutiful4View()
    }
}
