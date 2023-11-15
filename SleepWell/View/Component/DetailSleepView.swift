import SwiftUI

struct DetailSleepView: View {
    @State private var selectedTab = 0
    var body: some View {
        NavigationView {
                   TabView(selection: $selectedTab) {
                       ScrollView {
                           Text("Content for Tab 1")
                       }
                       .tabItem {
                           Label("Tab 1", systemImage: "1.square.fill")
                       }
                       .tag(0)
                       
                       ScrollView {
                           Text("Content for Tab 2")
                       }
                       .tabItem {
                           Label("Tab 2", systemImage: "2.square.fill")
                       }
                       .tag(1)
                   }
                   .navigationTitle("Tabbed View")
                   .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                   .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
               }
    }
}

#Preview {
    DetailSleepView()
}
