//
//  DogBreedDetailView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/6/24.
//


import SwiftUI

struct DogBreedDetailView: View {
    var breed: String
    @StateObject private var dogBreedViewModel = DogBreedViewModel()
    
    var body: some View {
        VStack {
            Text(breed.capitalized)
                .font(.largeTitle)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(dogBreedViewModel.dogImages.prefix(5), id: \.self) { imageUrl in
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image.resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 300, height: 300)
                    }
                }
            }
            
            Text("No description available")
                .foregroundColor(.gray)
                .padding()
            
            Spacer()
        }
        .onAppear {
            dogBreedViewModel.fetchDogBreedImages(breed: breed)
        }
    }
}
