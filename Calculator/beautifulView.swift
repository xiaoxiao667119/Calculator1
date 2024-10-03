import SwiftUI

struct beautifulView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    HStack {
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 24))
                            .foregroundColor(.white)
                        Text("切换界面")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding()
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.pink, .purple, .blue]), startPoint: .leading, endPoint: .trailing)
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 10)
                    )
                    .scaleEffect(1.1) // 默认放大一点
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.3)) // 添加弹簧动画
//                    Text("切换界面")
//                        .font(.system(size: 20, weight: .bold))
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(
//                            LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                                .cornerRadius(15)
//                                .shadow(color: .gray, radius: 10, x: 0, y: 10)
//                        )
//                        .padding()
                }
                .buttonStyle(PlainButtonStyle()) // 确保不使用默认的ButtonStyle
            }
            .navigationTitle("主界面")
        }
    }
}



#Preview {
    beautifulView()
}
