//
//  CatBreedDetailView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//

import SwiftUI

struct CatBreedDetailView: View {
    var breed: CatBreed
    @StateObject private var imageViewModel = CatBreedImageViewModel()

    var body: some View {
        VStack {
            Text(breed.name)
                .font(.largeTitle)
                .padding()

            if !imageViewModel.catBreedImages.isEmpty {
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 10) {
                        ForEach(imageViewModel.catBreedImages.prefix(5), id: \.id) { image in
                            AsyncImage(url: URL(string: image.url)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 300, height: 300)
                                    .cornerRadius(10)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 300, height: 300)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                Text("No images available")
                    .foregroundColor(.gray)
                    .padding()
            }

            Text(breed.description)
                .padding()
                .multilineTextAlignment(.leading)
            
            if let url = URL(string: breed.wikipedia_url ?? "") {
                Link("Learn more on Wikipedia", destination: url)
                    .padding()
                    .foregroundColor(.blue)
            }
            
            Spacer()
        }
        .onAppear {
            imageViewModel.fetchCatBreedImages(breedId: breed.id)
        }
    }
}
