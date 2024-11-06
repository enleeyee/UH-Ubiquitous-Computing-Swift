//
//  PairsView.swift
//  Exercise7_Yii_Enlai
//
//  Created by Enlai Yii on 11/5/24.
//

import SwiftUI
import WatchConnectivity

struct PairsView: View {
    @EnvironmentObject var selectedBreeds: SelectedBreeds
    @StateObject private var dogBreedViewModel = DogBreedViewModel()
    @StateObject private var catBreedImageViewModel = CatBreedImageViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                HStack(spacing: 20) {
                    if let dog = selectedBreeds.selectedDog {
                        VStack {
                            Text("\(dog.capitalized)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(10)
                            
                            if let dogImageURL = dogBreedViewModel.dogImages.first {
                                AsyncImage(url: URL(string: dogImageURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                }
                            } else {
                                Text("No image available")
                                    .foregroundColor(.gray)
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                    
                    if let cat = selectedBreeds.selectedCat {
                        VStack {
                            Text("\(cat.capitalized)")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color.green.opacity(0.1))
                                .cornerRadius(10)
                            
                            if let catImage = catBreedImageViewModel.catBreedImages.first {
                                AsyncImage(url: URL(string: catImage.url)) { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(10)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 150, height: 150)
                                }
                            } else {
                                Text("No image available")
                                    .foregroundColor(.gray)
                                    .frame(width: 150, height: 150)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Button(action: sendToWatch) {
                    Text("Send Pair to Watch")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle("Selected Pair")
        .onAppear {
            if let selectedDog = selectedBreeds.selectedDog {
                dogBreedViewModel.fetchDogBreedImages(breed: selectedDog)
            }
            if let selectedCat = selectedBreeds.selectedCat {
                catBreedImageViewModel.fetchCatBreedImages(breedId: selectedCat)
            }
        }
    }
    
    func sendToWatch() {
        // Check if there are selected images for dog and cat
        guard let dogImageURL = dogBreedViewModel.dogImages.first,
              let catImageURL = catBreedImageViewModel.catBreedImages.first?.url else {
            print("No images available to send")
            return
        }

        // Download dog and cat images asynchronously
        Task {
            do {
                let dogImageData = try await fetchImageData(from: dogImageURL)
                let catImageData = try await fetchImageData(from: catImageURL)
                
                // Resize images to send
                let resizedDogImageData = resizeImageData(dogImageData, to: CGSize(width: 45, height: 45))
                let resizedCatImageData = resizeImageData(catImageData, to: CGSize(width: 45, height: 45))
                
                // Send message and images to watch
                if WCSession.default.isReachable {
                    let message = ["message": "New dog and cat pair sent at \(Date().formatted(.dateTime.hour().minute().second()))!"]
                    
                    // Send the message first
                    WCSession.default.sendMessage(message, replyHandler: nil) { error in
                        print("Failed to send message to Watch: \(error.localizedDescription)")
                    }
                    
                    // Send the dog image data
                    WCSession.default.sendMessageData(resizedDogImageData, replyHandler: nil) { error in
                        print("Failed to send dog image data to Watch: \(error.localizedDescription)")
                    }
                    
                    // Send the cat image data
                    WCSession.default.sendMessageData(resizedCatImageData, replyHandler: nil) { error in
                        print("Failed to send cat image data to Watch: \(error.localizedDescription)")
                    }
                } else {
                    print("Watch is not reachable.")
                }
            } catch {
                print("Failed to fetch or resize images: \(error.localizedDescription)")
            }
        }
    }

    // Helper function to download image data
    func fetchImageData(from urlString: String) async throws -> Data {
        guard let url = URL(string: urlString) else { throw URLError(.badURL) }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }

    // Helper function to resize image data
    func resizeImageData(_ imageData: Data, to size: CGSize) -> Data {
        guard let image = UIImage(data: imageData) else { return imageData }
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.pngData() ?? imageData
    }
}
