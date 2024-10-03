import SwiftUI

struct weixinView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("首页")
                }

            ContactsView()
                .tabItem {
                    Image(systemName: "person.2.fill")
                    Text("联系人")
                }

            DiscoverView()
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("发现")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("我")
                }
        }
    }
}

struct weixinView_Previews: PreviewProvider {
    static var previews: some View {
        weixinView()
    }
}
