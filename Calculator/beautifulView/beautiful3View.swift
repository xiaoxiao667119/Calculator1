import SwiftUI

struct beautiful3View: View {
    @State private var isPressed = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .frame(width: 250, height: 60)
                            .shadow(color: .purple.opacity(0.3), radius: 10, x: 0, y: 10)
                        
                        Text("切换界面")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
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

struct beautiful3View_Previews: PreviewProvider {
    static var previews: some View {
        beautiful3View()
    }
}


