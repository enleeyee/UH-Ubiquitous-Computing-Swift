//
//  ContentView.swift
//  Exercise8_Yii_Enlai
//
//  Created by Enlai Yii on 11/8/24.
//

import SwiftUI
import NaturalLanguage
import CoreML

struct ContentView: View {
    
    var imageArray = ["car", "house", "people"]
    @ObservedObject var classifier: ImageClassifier
    
    @State var classificationText = "Classification Text.."
    @State var classificationImageName = "car"
    @State var syncService = SyncService()
    
    @State private var sentimentScore: Double = 0.0
    
    var body: some View {
                
        TabView {
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Pᵃ")
                        .foregroundStyle(.red)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }

                Spacer()
                
                Image(classificationImageName)
                    .resizable()
                    .frame(width: 350 , height:  350)
                    .border(.red, width: 5)
                    .onAppear {
                        classifier.detectObj(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage("mood", "\(analyzeSentiment(text: classifier.imageClass!))", { error in })
                    }
                    .onTapGesture {
                        classificationImageName = (imageArray.filter({$0 != classificationImageName})).randomElement()!
                        classifier.detectObj(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage("mood", "\(analyzeSentiment(text: classifier.imageClass!))", { error in })
                    }
                
                Spacer()
                
                Group {
                    
                    if let imageClass = classifier.imageClass {
                        HStack {
                            Text("Objects:")
                                .font(.system(size: 26))
                                
                            Text(imageClass)
                                .bold()
                                .lineLimit(7)
                        }
                        .foregroundStyle(.black)
                    } else {
                        HStack {
                            Text("No Objects Detected")
                                .font(.system(size: 26))
                        }.foregroundStyle(.white)
                    }
                    
                }
                .font(.headline)
                .padding()
                
                Spacer()
            
                Rectangle()
                    .frame(height:  0)
                    .background(.white)
                    .opacity(1)
            }
            .background(Color(red: 0/255, green: 203/255, blue: 190/255))
            .tabItem {
                Text("Object Identification")
                Image(systemName: "photo")
            }
     
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Pᵃ")
                        .foregroundStyle(.red)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                }
                
                Spacer()
                
                Image(classificationImageName)
                    .resizable()
                    .frame(width: 350 , height:  350)
                    .border(.red, width: 5)
                    .onAppear {
                        classifier.detectTxt(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage("mood", "\(analyzeSentiment(text: classifier.imageText!))", { error in })
                    }
                    .onTapGesture {
                        classificationImageName = (imageArray.filter({$0 != classificationImageName})).randomElement()!
                        classifier.detectTxt(uiImage: UIImage(named: classificationImageName)!)
                        syncService.sendMessage("mood", "\(analyzeSentiment(text: classifier.imageText!))", { error in })
                    }
                
                Spacer()
                
                Group {
                    if let imageText = classifier.imageText {
                        HStack {
                            Text("Text:")
                                .font(.system(size: 26))
                                
                            Text(imageText)
                                .bold()
                                .lineLimit(7)
                        }
                        .foregroundStyle(.black)
                    } else {
                        HStack {
                            Text("No text recognized")
                                .font(.system(size: 26))
                        }
                        .foregroundStyle(.white)
                    }
                }
                .font(.headline)
                .padding()
                
                Spacer()

                Rectangle()
                    .frame( height:  0)
                    .background(.white)
                    .opacity(0.7)
            }
            .background(Color(red: 0/255, green: 203/255, blue: 190/255))
            .tabItem {
                Text("Text Identification")
                Image(systemName: "doc.text")
            }
        }
        .accentColor(.blue)
    }
    
    func analyzeSentiment(text: String) -> Int {
        let text = String(text.prefix(100))
        
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
               tagger.string = text
               
        let sentiment = tagger.tag(at: text.startIndex, unit: .paragraph, scheme: .sentimentScore).0
        
        let score = Double(sentiment?.rawValue ?? "0") ?? 0
                sentimentScore = score

        let outputTxt = "The input: \(text) \n is "
               
        if score == 0 {
            print(outputTxt + "neutral with a score of \(score)")
            return 2
        } else if score < 0 {
            print(outputTxt + "negative with a score of \(score)")
            return 3
        } else {
            print(outputTxt + "positive with a score of \(score)")
            return 1
        }
    }
}

#Preview {
    ContentView(classifier: ImageClassifier())
}
