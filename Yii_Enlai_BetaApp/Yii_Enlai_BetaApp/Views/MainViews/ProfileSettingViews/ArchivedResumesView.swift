//
//  ArchivedChatsView.swift
//  Yii_Enlai_BetaApp
//
//  Created by Enlai Yii on 10/24/24.
//


import SwiftUI

struct ArchivedResumesView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search Archive")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                    // Archived Sections
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            ArchivedSectionView(
                                title: "Last week",
                                chats: ["Uni Library DB Back End"]
                            )

                            ArchivedSectionView(
                                title: "7 months ago",
                                chats: ["Software Design", "Amazon OA"]
                            )
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Archived Chats")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ArchivedSectionView: View {
    let title: String
    let chats: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.gray)

            ForEach(chats, id: \.self) { chat in
                Text(chat)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                Divider()
                    .background(Color.gray)
            }
        }
    }
}

#Preview {
    ArchivedResumesView()
}
