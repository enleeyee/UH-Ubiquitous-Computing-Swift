//
//  HomeView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/5/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var dogBreedViewModel = DogBreedViewModel()
    @StateObject private var catBreedViewModel = CatBreedViewModel()
    
    @EnvironmentObject var selectedBreeds: SelectedBreeds
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                VStack {
                    Text("Dog Breeds")
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(dogBreedViewModel.dogBreeds.keys.sorted(), id: \.self) { breed in
                                HStack {
                                    NavigationLink(destination: DogBreedDetailView(breed: breed)) {
                                        Text(breed.capitalized)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .background(selectedBreeds.selectedDog == breed ? Color.blue.opacity(0.2) : Color.blue.opacity(0.1))
                                            .cornerRadius(10)
                                    }
                                    
                                    Button(action: {
                                        // Toggle dog selection
                                        selectedBreeds.selectedDog = (selectedBreeds.selectedDog == breed) ? nil : breed
                                    }) {
                                        Image(systemName: selectedBreeds.selectedDog == breed ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(.blue)
                                            .padding()
                                            .background(Color.blue.opacity(0.2))
                                            .clipShape(Circle())
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
                
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Text("Cat Breeds")
                        .font(.title)
                        .bold()
                        .padding(.top)
                    
                    ScrollView {
                        LazyVStack {
                            ForEach(catBreedViewModel.catBreeds, id: \.id) { breed in
                                HStack {
                                    NavigationLink(destination: CatBreedDetailView(breed: breed)) {
                                        Text(breed.name)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .background(selectedBreeds.selectedCat == breed.id ? Color.green.opacity(0.2) : Color.green.opacity(0.1))
                                            .cornerRadius(10)
                                    }
                                    
                                    Button(action: {
                                        // Toggle cat selection
                                        selectedBreeds.selectedCat = (selectedBreeds.selectedCat == breed.id) ? nil : breed.id
                                    }) {
                                        Image(systemName: selectedBreeds.selectedCat == breed.id ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(.green)
                                            .padding()
                                            .background(Color.green.opacity(0.2))
                                            .clipShape(Circle())
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
                .frame(maxHeight: .infinity)
            }
            .navigationTitle("Home")
            .onAppear {
                dogBreedViewModel.fetchDogBreeds()
                catBreedViewModel.fetchCatBreeds()
            }
        }
    }
}
