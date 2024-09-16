//
//  ContentView.swift
//  Exercise3_Yii_Enlai
//
//  Created by Enlai Yii on 9/11/24.
//

import SwiftUI

struct ContentView: View {
    
    struct Card {
        var title: String
        var details: [String]
        let imageName: String
    }
    
    @State var showOptions = false
    @State private var cards: [Card] = [
        Card(title: "iPhone 6", details: [
            "Released: in 2014",
            "Design: Aluminum body, larger 4.7-inch or 5.5-inch display",
            "Processor: A8 chip",
            "Camera: 8MP rear-facing camera",
            "Storage: 16GB, 64GB, or 128GB",
            "Battery: 1810mAh (4.7-inch) or 2915mAh (5.5-inch)",
            "Notable features: Touch ID fingerprint sensor, Apple Pay"
        ], imageName: "Image1"),
        
        Card(title: "iPhone 12", details: [
            "Released: 2020",
            "Design: Flat edges, ceramic shield front, glass back",
            "Processor: A14 Bionic chip",
            "Camera: Dual 12MP rear-facing cameras",
            "Storage: 64GB, 128GB, or 256GB",
            "Battery: 2815mAh (6.1-inch) or 2775mAh (5.4-inch)",
            "Notable features: 5G connectivity, MagSafe wireless charging, OLED display"
        ], imageName: "Image2"),
        
        Card(title: "iPhone 16", details: [
            "Release: 2024",
            "Design: Similar to iPhone 15, but with potential design refinements",
            "Processor: A17 Bionic chip",
            "Camera: Improved camera system with potentially larger sensor and better low-light performance",
            "Storage: Likely to start at 128GB",
            "Battery: Expected to have improved battery life",
            "Notable features: Advanced iOS features, potential new color options",
        ], imageName: "Image3"),
    ]
    
    @State private var currentCardIndex: Int = 0
    @State private var isBulletPointSheetPresented: Bool = false
    @State private var newBulletPoint: String = ""
    
    var body: some View {
        VStack {
            Text("iPhone Explorer")
                .padding()
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 65 / 255.0, green: 88 / 255.0, blue: 166 / 255.0))
                .shadow(radius: 10)
            
            Image(cards[currentCardIndex].imageName)
                .resizable()
                .frame(width: 120, height: 120)
                .shadow(radius: 5, x: 8, y: 8)
            Spacer()

            VStack(alignment: .leading) {
                Text("\(cards[currentCardIndex].title)")
            }
            .frame(minWidth: 350, minHeight: 45)
            .font(.title2)
            .bold()
            .background(Color.orange)
            .foregroundColor(.white)
            .padding(.bottom, -10)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(cards[currentCardIndex].details, id: \.self) { detail in
                        Text("\(Image(systemName: "apple.logo")) \(detail)")
                            .padding(.bottom, 5)
                    }
                }
                .padding()
            }
            .frame(width: 350, height: 200)
            .background(Color(red: 241 / 255.0, green: 222 / 255.0, blue: 198 / 255.0))
            .cornerRadius(1)
            
            Spacer()
            
            VStack {
                Button(action: {
                    currentCardIndex = (currentCardIndex + 1) % cards.count
                }) {
                    Text("Next phone")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title).fontWeight(.bold)
                        .background(Color(red: 23.0/255, green: 155.0/255, blue: 174.0/255))
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    showOptions = true
                }) {
                    Text("Phone selector")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .font(.title).fontWeight(.bold)
                        .background(Color(red: 23.0/255, green: 155.0/255, blue: 174.0/255))
                        .foregroundColor(.white)
                        .confirmationDialog("Pick a topic", isPresented: $showOptions, titleVisibility: .visible) {
                            ForEach(cards.indices, id: \.self) { index in
                                Button(cards[index].title) {
                                    currentCardIndex = index
                                }
                            }
                        }
                }
                
                Button(action: {
                    isBulletPointSheetPresented = true
                }) {
                    Text("Add new bullet")
                        .padding()
                        .font(.title.bold())
                        .frame(maxWidth: .infinity)
                        .background(Color.rgb(255, 149, 3))
                        .foregroundColor(.white)
                }
                .sheet(isPresented: $isBulletPointSheetPresented) {
                    AddBulletView(
                        bulletPoint: $newBulletPoint,
                        iphoneTitle: $cards[currentCardIndex].title,
                        onSave: {
                            if !newBulletPoint.isEmpty {
                                cards[currentCardIndex].details.append(newBulletPoint)
                                newBulletPoint = ""
                            } else {
                                cards[currentCardIndex].details.append(newBulletPoint)
                            }
                        }
                    )
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        Spacer()
    }
}

#Preview {
    ContentView()
}
