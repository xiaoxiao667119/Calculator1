import SwiftUI

struct TanchuView: View {
    @State private var showSheet1 = false
    @State private var showSheet2 = false
    @State private var showAlert = false
    @State private var showActionSheet = false
    @State private var navigationLinkActive = false
    @State private var showFullScreenCover = false
    @State private var showFlipView = false
    @State private var showSlideView = false
    @State private var showScaleView = false
    @State private var showOpacityView = false
    @State private var showRotateView = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ForEach(1...10, id: \.self) { index in
                    Button(action: {
                        handleButtonTap(index: index)
                    }) {
                        Text("Button \(index)")
                            .font(.system(size: 24, weight: .bold))
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .scaleEffect(index == 1 ? 1.2 : 1.0)
                            .rotationEffect(index == 2 ? .degrees(10) : .degrees(0))
                            .animation(.easeInOut(duration: 0.5), value: showSheet1)
                            .animation(.easeInOut(duration: 0.5), value: showSheet2)
                    }
                    .onLongPressGesture(minimumDuration: 1.0) {
                        handleButtonLongPress(index: index)
                    }
                }

                NavigationLink(destination: NewPageView(title: "Push Navigation 5"), isActive: $navigationLinkActive) {
                    EmptyView()
                }
            }
            .sheet(isPresented: $showSheet1) {
                NewPageView(title: "Sheet 1")
            }
            .fullScreenCover(isPresented: $showSheet2) {
                NewPageView(title: "Full Screen 2")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Alert"), message: Text("Button 3 Pressed"), dismissButton: .default(Text("OK")))
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(title: Text("Action Sheet"), message: Text("Button 4 Pressed"), buttons: [.default(Text("OK"))])
            }
            .fullScreenCover(isPresented: $showFlipView) {
                FlipView(title: "Flip Transition")
            }
            .fullScreenCover(isPresented: $showSlideView) {
                SlideView(title: "Slide Transition")
            }
            .fullScreenCover(isPresented: $showScaleView) {
                ScaleView(title: "Scale Transition")
            }
            .fullScreenCover(isPresented: $showOpacityView) {
                OpacityView(title: "Opacity Transition")
            }
            .fullScreenCover(isPresented: $showRotateView) {
                RotateView(title: "Rotate Transition")
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func handleButtonTap(index: Int) {
        switch index {
        case 1:
            withAnimation {
                showSheet1 = true
            }
        case 2:
            withAnimation {
                showSheet2 = true
            }
        case 3:
            withAnimation {
                showAlert = true
            }
        case 4:
            withAnimation {
                showActionSheet = true
            }
        case 5:
            withAnimation {
                navigationLinkActive = true
            }
        case 6:
            withAnimation {
                showFlipView = true
            }
        case 7:
            withAnimation {
                showSlideView = true
            }
        case 8:
            withAnimation {
                showScaleView = true
            }
        case 9:
            withAnimation {
                showOpacityView = true
            }
        case 10:
            withAnimation {
                showRotateView = true
            }
        default:
            break
        }
    }

    func handleButtonLongPress(index: Int) {
        switch index {
        case 6:
            withAnimation(.spring()) {
                showSlideView = true
            }
        case 7:
            withAnimation(.easeInOut) {
                showScaleView = true
            }
        case 8:
            withAnimation(.linear(duration: 0.3)) {
                showOpacityView = true
            }
        case 9:
            withAnimation(.easeInOut(duration: 0.3)) {
                showRotateView = true
            }
        case 10:
            withAnimation(.easeOut(duration: 0.3)) {
                showFlipView = true
            }
        default:
            break
        }
    }
}

struct TanchuView_Previews: PreviewProvider {
    static var previews: some View {
        TanchuView()
    }
}
