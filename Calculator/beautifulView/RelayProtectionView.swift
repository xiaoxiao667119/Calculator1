import SwiftUI

struct RelayProtectionView: View {
    @State private var showSymmetricalComponentView = false
    
    var body: some View {
        VStack {
            Text("继电保护功能")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                showSymmetricalComponentView = true
            }) {
                Text("对称分量法")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding()
            .sheet(isPresented: $showSymmetricalComponentView) {
                SymmetricalComponentView()
            }
            
            // 其他继电保护相关的高级功能按钮
        }
        .padding()
    }
}

struct RelayProtectionView_Previews: PreviewProvider {
    static var previews: some View {
        RelayProtectionView()
    }
}
