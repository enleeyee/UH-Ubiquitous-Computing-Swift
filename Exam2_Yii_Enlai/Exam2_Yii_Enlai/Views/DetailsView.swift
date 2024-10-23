//
//  DetailsView.swift
//  Exam2_Yii_Enlai
//
//  Created by Enlai Yii on 10/17/24.
//

import SwiftUI

struct DetailsView: View {
    var breed: String
    @StateObject private var viewModel: BreedImageViewModel
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var isFavorite: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    // Custom initializer
    init(breed: String) {
        self.breed = breed
        // Initialize viewModel with the breed parameter
        self._viewModel = StateObject(wrappedValue: BreedImageViewModel(breed: breed))
    }
    
    var body: some View {
        // Check the vertical size class to determine layout
        Group {
            if verticalSizeClass == .regular {
                // Portrait Layout
                VStack {
                    HStack {
                        Text(breed.capitalized)
                            .font(.largeTitle)
                            .padding(.top)
                        
                        // Star button to toggle favorite status
                        Button(action: {
                            isFavorite.toggle()
                            favoritesManager.toggleFavorite(breed: breed)
                        }) {
                            Image(systemName: favoritesManager.isFavorite(breed: breed) ? "star.fill" : "star")
                                .foregroundColor(favoritesManager.isFavorite(breed: breed) ? .black : .gray)
                                .frame(width: 25, height: 25, alignment: .center)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Show breed images if loaded
                    if let images = viewModel.breedImages, !images.isEmpty {
                        TabView {
                            ForEach(images, id: \.self) { imageUrl in
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView() // Show a loading spinner while the image is loading
                                }
                                .frame(width: 300, height: 300)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle()) // For paging between images
                        .frame(height: 300)
                        
                        Text("No description available")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        // Fallback text if no images available
                        Text("No description available")
                            .foregroundColor(.gray)
                            .padding()
                    }
                    
                    Spacer()
                }
            } else {
                // Landscape Layout
                HStack {
                    Text(breed.capitalized)
                        .font(.largeTitle)
                        .padding(.top)
                    
                    // Star button to toggle favorite status
                    Button(action: {
                        isFavorite.toggle()
                        favoritesManager.toggleFavorite(breed: breed)
                    }) {
                        Image(systemName: favoritesManager.isFavorite(breed: breed) ? "star.fill" : "star")
                            .foregroundColor(favoritesManager.isFavorite(breed: breed) ? .black : .gray)
                            .frame(width: 25, height: 25, alignment: .center)
                    }
                }
                .padding(.horizontal)

                // Show breed images if loaded
                if let images = viewModel.breedImages, !images.isEmpty {
                    HStack {
                        TabView {
                            ForEach(images, id: \.self) { imageUrl in
                                AsyncImage(url: URL(string: imageUrl)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                } placeholder: {
                                    ProgressView() // Show a loading spinner while the image is loading
                                }
                                .frame(width: 200, height: 200) // Adjust size for landscape
                            }
                        }
                        .tabViewStyle(PageTabViewStyle()) // For paging between images
                        .frame(height: 200) // Adjust frame height for landscape
                        
                        Text("No description available")
                            .foregroundColor(.gray)
                            .padding()
                    }
                } else {
                    // Fallback text if no images available
                    Text("No description available")
                        .foregroundColor(.gray)
                        .padding()
                }

                Spacer()
            }
        }
        .onAppear {
            Task {
                await viewModel.loadBreedImages()
            }
            isFavorite = favoritesManager.isFavorite(breed: breed)
        }
    }
}

#Preview {
    DetailsView(breed: "hound")
        .environmentObject(FavoritesManager()) // Provide the environment object
}
