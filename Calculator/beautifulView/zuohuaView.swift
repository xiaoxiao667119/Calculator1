import SwiftUI

struct zuohuaView: View {
    @State private var showMenu = false
    
    var body: some View {
        NavigationView {
            ZStack {
                MainView()
                    .navigationTitle("主界面")
                
                if showMenu {
                    MenuView(showMenu: $showMenu)
                        .transition(.move(edge: .leading))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if value.translation.width > 100 {
                            withAnimation {
                                showMenu = true
                            }
                        }
                    }
            )
        }
    }
}

struct zuohuaView_Previews: PreviewProvider {
    static var previews: some View {
        zuohuaView()
    }
}

struct MainView: View {
    var body: some View {
        VStack {
            Text("主界面内容")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
    }
}

struct MenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    showMenu = false
                }
            }) {
                HStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .padding()
            }
            NavigationLink(destination: FirstFeatureView()) {
                HStack {
                    Image(systemName: "1.circle")
                    Text("功能1")
                }
                .padding()
            }
            NavigationLink(destination: SecondFeatureView()) {
                HStack {
                    Image(systemName: "2.circle")
                    Text("功能2")
                }
                .padding()
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
    }
}
