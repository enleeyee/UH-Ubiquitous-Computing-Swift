//
//  HomeScreenView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject private var viewModel = DogViewModel()
    @EnvironmentObject var favoritesManager: FavoritesManager // Use environment object

    var body: some View {
        NavigationStack {
            VStack {
                // Search Bar
                TextField(
                    "\(Image(systemName: "magnifyingglass")) Search",
                    text: $viewModel.searchText
                )
                .padding(5)
                .background(Color.init(red: 227/255, green: 227/255, blue: 232/255))
                .cornerRadius(10)
                .padding(.horizontal)

                // Breed List with rounded background
                List(viewModel.filteredBreeds, id: \.self) { breed in
                    HStack {
                        Text(breed.capitalized)
                            .font(.headline)
                            .foregroundColor(.black)

                        NavigationLink(destination: DetailsView(breed: breed)) {
                            EmptyView()
                        }.opacity(0.0)

                        Spacer()

                        // Star button to toggle favorite status
                        Button(action: {
                            favoritesManager.toggleFavorite(breed: breed)
                        }) {
                            Image(systemName: favoritesManager.isFavorite(breed: breed) ? "star.fill" : "star")
                                .foregroundColor(favoritesManager.isFavorite(breed: breed) ? .black : .gray)
                                .frame(width: 25, height: 25, alignment: .center)
                        }
                        .buttonStyle(BorderlessButtonStyle()) // Ensure the button is clickable in the List
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 100)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(red: 229/255, green: 229/255, blue: 233/255)))
                    .shadow(radius: 1)
                    .padding(.vertical, 5)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Dog Breeds")
            .onAppear {
                Task {
                    await viewModel.loadBreeds()
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
        .environmentObject(FavoritesManager()) // Provide the environment object
}
