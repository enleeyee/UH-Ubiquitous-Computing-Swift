import SwiftUI

struct DataControlsView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()

                Form {
                    Section {
                        Toggle("Improve the model for everyone", isOn: .constant(true))
                        Text("Allow your content to be used to train our models, which makes ChatGPT better for you and everyone who uses it. We take steps to protect your privacy.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 2)

                        Link("Learn more", destination: URL(string: "https://example.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                            .padding(.bottom, 10)

                        Toggle("Improve voice for everyone", isOn: .constant(false))
                        Text("Share audio from voice chats to train our models. This improves the quality of voice chats for everyone.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 2)

                        Link("Learn more", destination: URL(string: "https://example.com")!)
                            .font(.footnote)
                            .foregroundColor(.blue)
                    }
                    
                    Section {
                        Button(action: {
                            print("Archive All Chats tapped")
                        }) {
                            Text("Archive All Chats")
                                .foregroundColor(.primary)
                        }
                        
                        Button(action: {
                            print("Delete All Chats tapped")
                        }) {
                            Text("Delete All Chats")
                                .foregroundColor(.red)
                        }
                    }

                    Section {
                        Button(action: {
                            print("Export Data tapped")
                        }) {
                            Text("Export Data")
                                .foregroundColor(.primary)
                        }

                        Button(action: {
                            print("Delete Account tapped")
                        }) {
                            Text("Delete Account")
                                .foregroundColor(.red)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Data Controls")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    DataControlsView()
}
