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
                        Button(action: {
                            print("Archive All Chats tapped")
                        }) {
                            Text("Archive All Chats")
                                .foregroundColor(.primary)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        Button(action: {
                            print("Delete All Chats tapped")
                        }) {
                            Text("Delete All Chats")
                                .foregroundColor(.red)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }

                    Section {
                        Button(action: {
                            print("Export Data tapped")
                        }) {
                            Text("Export Data")
                                .foregroundColor(.primary)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            print("Delete Account tapped")
                        }) {
                            Text("Delete Account")
                                .foregroundColor(.red)
                        }
                        .listRowBackground(CustomColor.LightBlue)
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
