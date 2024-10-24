import SwiftUI

struct ProfilePageView: View {
    @State private var selectedColorScheme = "Light"
    @State private var showPersonalization = false
    @State private var showDataControls = false
    @State private var showArchivedResumes = false
    
    @State private var showLandingPage = false

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea(edges: .top)

                Form {
                    Section(header: Text("ACCOUNT")) {
                        HStack {
                            Label("Email", systemImage: "envelope")
                                .foregroundColor(.black)
                            Spacer()
                            Text("example@gmail.com")
                                .foregroundColor(.gray)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showPersonalization = true
                        }) {
                            HStack {
                                Label("Personalization", systemImage: "person")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showDataControls = true
                        }) {
                            HStack {
                                Label("Data Controls", systemImage: "server.rack")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showArchivedResumes = true
                        }) {
                            HStack {
                                Label("Archived Resumes", systemImage: "archivebox")
                                    .foregroundColor(.black)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                            }
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
                            Text("Light").tag("Light")
                            Text("Dark").tag("Dark")
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
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showPersonalization) {
                PersonalizationView()
            }
            .sheet(isPresented: $showDataControls) {
                DataControlsView()
            }
            .sheet(isPresented: $showArchivedResumes) {
                ArchivedResumesView()
            }
            .fullScreenCover(isPresented: $showLandingPage) {
                LoginView()
            }
        }
    }
}

#Preview {
    ProfilePageView()
}
