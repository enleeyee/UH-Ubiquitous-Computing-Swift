//
//  ContentView.swift
//  Exercise2_Yii_Enlai
//
//  Created by Enlai Yii on 8/29/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var titleDescription = ["Released", "Design", "Processor", "Camera", "Storage"]
    
    @State private var iphoneDetails = [
        PhoneDetails(
            title: "iPhone 6",
            released: "2014",
            design: "Aluminum body, larger 4.7-inch or 5.5-inch display",
            processor: "A8 chip",
            camera: "8MP rear-facing camera",
            storage: "16GB, 64GB, or 128GB",
            battery: "1810mAh (4.7-inch) or 2915mAh (5.5-inch)",
            features: "Touch ID fingerprint sensor, Apple Pay",
            image: "Image1"
        ),
        PhoneDetails(
            title: "iPhone 12",
            released: "2020",
            design: "Flat edges, ceramic shield front, glass back",
            processor: "A14 Bionic chip",
            camera: "Dual 12MP rear-facing cameras",
            storage: "64GB, 128GB, or 256GB",
            battery: "2815mAh (6.1-inch) or 2775mAh (5.4-inch)",
            features: "5G connectivity, MagSafe wireless charging, OLED display",
            image: "Image2"
        ),
        PhoneDetails(
            title: "iPhone 16",
            released: "2024",
            design: "Similar to iPhone 15, but with potential design refinements",
            processor: "A17 Bionic chi",
            camera: "Improved camera system with potentially larger sensor and better low-light performance",
            storage: "Likely to start at 128GB",
            battery: "Expected to have improved battery life",
            features: "Advanced iOS features, potential new color options",
            image: "Image3"
        )
    ]

    @State private var iphoneIndex = 0
    @State private var showingActionSheet = false
    
    var body: some View {
        VStack {
            Text("iPhone Explorer")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 78/255, green: 85/255, blue: 159/255))
            
            Image(iphoneDetails[iphoneIndex].image)
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(
                    color: .gray,
                    radius: CGFloat(5),
                    x: CGFloat(5), y: CGFloat(5)
                )
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 8) {
                    let phone = iphoneDetails[iphoneIndex]
                    ForEach(Array(Mirror(reflecting: phone).children.enumerated()), id: \.offset) { index, child in
                        if let propertyName = child.label {
                            if propertyName == "title" {
                                Text("\(child.value)")
                                    .padding(8)
                                    .font(.title3)
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 247/255, green: 149/255, blue: 5/255))
                                    .foregroundColor(.white)
                                
                            } else if propertyName != "image" {
                                Text(" \(propertyName.capitalized): \(child.value)")
                                    .font(.system(size: 18))
                                    .padding(.leading)
                            }
                        }
                    }
                }
                .background(Color(red: 240/255, green: 222/255, blue: 198/255))
                .frame(alignment: .top)
                .padding(.vertical, 20)
            }
            .frame(width: 350, height: 250)
            Spacer()
            
            Button(action: {
                showNextRandomIphone()
            }){
                Text("Random phone")
                    .padding()
                    .font(.title.bold())
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0/255, green: 144/255, blue: 164/255))
                    .foregroundColor(.white)
            }
            
            Button(action: {
                showNextIphone()
            }){
                Text("Next phone")
                    .padding()
                    .font(.title.bold())
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0/255, green: 144/255, blue: 164/255))
                    .foregroundColor(.white)
            }
            
            Button(action: {
                showingActionSheet = true
            }){
                Text("Phone selector")
                    .padding()
                    .font(.title.bold())
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0/255, green: 144/255, blue: 164/255))
                    .foregroundColor(.white)
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(
                    title: Text("Pick a phone"),
                    buttons: createActionSheetButtons()
                )
            }
            Spacer()
        }
        .padding()
    }
    
    func showNextRandomIphone() {
        let previousIndex = iphoneIndex
        repeat {
            iphoneIndex = Int.random(in: 0..<iphoneDetails.count)
        } while (previousIndex == iphoneIndex)
    }
    
    func showNextIphone() {
        iphoneIndex = (iphoneIndex + 1) % iphoneDetails.count
    }
    
    func createActionSheetButtons() -> [ActionSheet.Button] {
        let buttons: [ActionSheet.Button] = iphoneDetails.map { phone in
            .default(Text(phone.title)) {
                iphoneIndex = iphoneDetails.firstIndex(where: { $0.title == phone.title }) ?? 0
            }
        }
        return buttons + [.cancel()]
    }
}

#Preview {
    ContentView()
}
