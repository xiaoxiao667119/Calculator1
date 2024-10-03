import SwiftUI

struct FirstFeatureView: View {
    var body: some View {
        VStack {
            Text("这是功能1界面")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("功能1")
    }
}

struct FirstFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        FirstFeatureView()
    }
}

struct SecondFeatureView: View {
    var body: some View {
        VStack {
            Text("这是功能2界面")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("功能2")
    }
}

struct SecondFeatureView_Previews: PreviewProvider {
    static var previews: some View {
        SecondFeatureView()
    }
}
