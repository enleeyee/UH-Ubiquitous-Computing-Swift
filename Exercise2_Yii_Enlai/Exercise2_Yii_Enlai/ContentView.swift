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
        [
            "2014",
            "Aluminum body, larger 4.7-inch or 5.5-inch display",
            "A8 chip",
            "8MP rear-facing camera",
            "16GB, 64GB, or 128GB"
        ],
        [
            "2020",
            "Flat edges, ceramic shield front, glass back",
            "A14 Bionic chip",
            "Dual 1MP rear-facing camera",
            "64GB, 128GB, or 256GB"
        ],
        [
            "2024",
            "Similar to iPhone15, but with potential design refinements",
            "A17 Bionic chip",
            "Improved camera system with potentially larger sensor and better low-light performance",
            "128GB, 256GB, or 512GB"
        ]
    ]
    @State private var iphoneImages = ["Image1", "Image2", "Image3"]
    @State private var iphoneTitles = ["iPhone 6", "iPhone 12", "iPhone 16"]
    
    @State private var iphoneIndex = 0
    @State private var showingActionSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("iPhone Explorer")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 78/255, green: 85/255, blue: 159/255))
            
            Image(iphoneImages[iphoneIndex])
                .resizable()
                .frame(width: 100, height: 100)
                .shadow(
                    color: .gray,
                    radius: CGFloat(5),
                    x: CGFloat(5), y: CGFloat(5)
                )
            
            VStack(alignment: .leading) {
                Text(iphoneTitles[iphoneIndex])
                    .padding(8)
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 247/255, green: 149/255, blue: 5/255))
                    .foregroundColor(.white)

                ForEach(0..<titleDescription.count, id: \.self) {
                    index in
                    HStack(alignment: .top) {
                        Image(systemName: "applelogo")
                        Text("\(titleDescription[index]): \(iphoneDetails[iphoneIndex][index])")
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.leading, 4)
                }
            }
            .frame(width: 350, height: 200)
            .background(Color(red: 240/255, green: 222/255, blue: 198/255))
            .padding(.vertical, 20)
            
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
            .actionSheet(isPresented: $showingActionSheet){
                ActionSheet(title: Text("Pick a topc"),
                            buttons:
                                createActionSheetButtons()
                )
            }
            Spacer()
        }
        .padding()
    }
    
    func showNextRandomIphone() {
        iphoneIndex = Int.random(in: 0..<iphoneTitles.count)
    }
    
    func showNextIphone() {
        iphoneIndex = (iphoneIndex + 1) % iphoneTitles.count
    }
    
    func createActionSheetButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = iphoneTitles.map{
            iphone in .default(Text(iphone)) {
                iphoneIndex = iphoneTitles.firstIndex(of: iphone) ?? 0
            }
        }
        buttons.append(.cancel())
        return buttons
    }
}

#Preview {
    ContentView()
}
