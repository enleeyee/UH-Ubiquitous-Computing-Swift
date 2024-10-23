//
//  FavoritesView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationStack {
            VStack {
                if favoritesManager.favoriteBreeds.isEmpty {
                    Text("No favorites yet")
                        .foregroundColor(.gray)
                        .font(.headline)
                        .padding()
                } else {
                    List(favoritesManager.favoriteBreeds, id: \.self) { breed in
                        HStack {
                            Text(breed.capitalized)
                                .font(.headline)
                            
                            NavigationLink(destination: DetailsView(breed: breed)) {
                                EmptyView()
                            }.opacity(0.0)
                            
                            Spacer()
                            
                            Button(action: {
                                favoritesManager.toggleFavorite(breed: breed)
                            }) {
                                Image(systemName: favoritesManager.isFavorite(breed: breed) ? "star.fill" : "star")
                                    .foregroundColor(favoritesManager.isFavorite(breed: breed) ? .black : .gray)
                                    .frame(width: 25, height: 25, alignment: .center)
                            }.buttonStyle(BorderlessButtonStyle()) // Ensure the button is clickable in the List
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 100)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.init(red: 229/255, green: 229/255, blue: 233/255)))
                        .shadow(radius: 1)
                        .padding(.vertical, 5)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Favorite Breeds")
        }
    }
}

#Preview {
    FavoritesView()
        .environmentObject(FavoritesManager()) // Preview with an environment object
}
