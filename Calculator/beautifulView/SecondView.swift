import SwiftUI

struct SecondView: View {
    var body: some View {
        VStack {
            Text("这是第二个界面")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("第二个界面")
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}


