//
import SwiftUI

struct HomeView: View {
    @State private var items = Array(1...20)
    @State private var isRefreshing = false
    @State private var isLoadingMore = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text("Item \(item)")
                }
                if isLoadingMore {
                    ProgressView()
                        .onAppear(perform: loadMore)
                }
            }
            .refreshable {
                refresh()
            }
            .navigationTitle("首页")
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
