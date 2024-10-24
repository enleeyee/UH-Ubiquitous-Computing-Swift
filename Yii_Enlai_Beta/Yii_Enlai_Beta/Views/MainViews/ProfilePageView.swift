import SwiftUI

struct ProfilePageView: View {
    @State private var selectedColorScheme = "Light"
    
    @State private var showLandingPage = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()
                
                Form {

                    Section(header: Text("ACCOUNT")) {
                        HStack {
                            Label("Email", systemImage: "envelope")
                                .foregroundColor(.black)
                            Spacer()
                            Text("examplee@gmail.com")
                                .foregroundColor(.gray)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        NavigationLink(destination: Text("Personalization")) {
                            Label("Personalization", systemImage: "person")
                                .foregroundColor(.black)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        NavigationLink(destination: Text("Data Controls")) {
                            Label("Data Controls", systemImage: "server.rack")
                                .foregroundColor(.black)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        NavigationLink(destination: Text("Archived Chats")) {
                            Label("Archived Resumes", systemImage: "archivebox")
                                .foregroundColor(.black)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                    
                    Section(header: Text("APP")) {
                        HStack {
                            Label("App Language", systemImage: "globe")
                                .foregroundColor(.black)
                            Spacer()
                            Text("English")
                                .foregroundColor(.gray)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        Picker(selection: $selectedColorScheme, label: Label("Color Scheme", systemImage: "sun.max")
                            .foregroundColor(.black)
                        ) {
                            Text("Light")
                                .tag("Light")
                            
                            Text("Dark")
                                .tag("Dark")
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                    
                    Section {
                        Button(action: {
                            showLandingPage = true
                        }) {
                            Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(.black)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                }
                .fullScreenCover(isPresented: $showLandingPage) {
                    LandingPageView()
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfilePageView()
}
