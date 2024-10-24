import SwiftUI

struct MainTabView: View {
    var body: some View {
        VStack(spacing: 0) {
            TabView {
                AIPageView()
                    .tabItem {
                        Image(systemName: "brain")
                        Text("AI")
                    }
                
                ResumesPageView()
                    .tabItem {
                        Image(systemName: "doc.text")
                        Text("Resumes")
                    }
                
                ProfilePageView()
                    .tabItem {
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    }
            }
            .background(Color.clear)
            .toolbarBackground(Color.gray, for: .tabBar)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
}

#Preview {
    MainTabView()
}
