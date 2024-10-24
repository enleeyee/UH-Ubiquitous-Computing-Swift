import SwiftUI

struct MainTabView: View {
    var body: some View {
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
    }
}

#Preview {
    MainTabView()
}
