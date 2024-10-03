import SwiftUI

struct ContactsView: View {
    @State private var items = Array(1...20)
    @State private var isRefreshing = false
    @State private var isLoadingMore = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("联系人 \(item)")
                }
                if isLoadingMore {
                    ProgressView()
                        .onAppear(perform: loadMore)
                }
            }
            .refreshable {
                refresh()
            }
            .navigationTitle("联系人")
        }
    }
    
    private func refresh() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            items = Array(1...20)
            isRefreshing = false
        }
    }
    
    private func loadMore() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let moreItems = items.count + 1...items.count + 20
            items.append(contentsOf: moreItems)
            isLoadingMore = false
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}

struct DiscoverView: View {
    @State private var items = Array(1...20)
    @State private var isRefreshing = false
    @State private var isLoadingMore = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("发现 \(item)")
                }
                if isLoadingMore {
                    ProgressView()
                        .onAppear(perform: loadMore)
                }
            }
            .refreshable {
                refresh()
            }
            .navigationTitle("发现")
        }
    }
    
    private func refresh() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            items = Array(1...20)
            isRefreshing = false
        }
    }
    
    private func loadMore() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let moreItems = items.count + 1...items.count + 20
            items.append(contentsOf: moreItems)
            isLoadingMore = false
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}

struct ProfileView: View {
    @State private var items = Array(1...20)
    @State private var isRefreshing = false
    @State private var isLoadingMore = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("我 \(item)")
                }
                if isLoadingMore {
                    ProgressView()
                        .onAppear(perform: loadMore)
                }
            }
            .refreshable {
                refresh()
            }
            .navigationTitle("我")
        }
    }
    
    private func refresh() {
        isRefreshing = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            items = Array(1...20)
            isRefreshing = false
        }
    }
    
    private func loadMore() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let moreItems = items.count + 1...items.count + 20
            items.append(contentsOf: moreItems)
            isLoadingMore = false
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
