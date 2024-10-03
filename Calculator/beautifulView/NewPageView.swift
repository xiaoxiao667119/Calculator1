import SwiftUI

struct NewPageView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct FlipView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .transition(.move(edge: .bottom))
        .animation(.easeInOut)
    }
}

struct SlideView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .transition(.slide)
        .animation(.easeInOut)
    }
}

struct ScaleView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .scaleEffect()
        .animation(.easeInOut)
    }
}

struct OpacityView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .opacity(0.1)
        .animation(.easeInOut)
    }
}

struct RotateView: View {
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .rotationEffect(.degrees(180))
        .animation(.easeInOut)
    }
}

struct NewPageView_Previews: PreviewProvider {
    static var previews: some View {
        NewPageView(title: "Sheet 1")
    }
}

struct FlipView_Previews: PreviewProvider {
    static var previews: some View {
        FlipView(title: "Preview")
    }
}

struct SlideView_Previews: PreviewProvider {
    static var previews: some View {
        SlideView(title: "Preview")
    }
}

struct ScaleView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleView(title: "Preview")
    }
}

struct OpacityView_Previews: PreviewProvider {
    static var previews: some View {
        OpacityView(title: "Preview")
    }
}

struct RotateView_Previews: PreviewProvider {
    static var previews: some View {
        RotateView(title: "Preview")
    }
}
