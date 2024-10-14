//
//  StoryView.swift
//  Exam1_Yii_Enlai
//
//  Created by Enlai Yii on 9/19/24.
//

import SwiftUI

struct StoryView: View {
    
    @Environment(\.presentationMode) var presentionMode
    
    @Binding var title: String
    @Binding var story: String
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            
            if verticalSizeClass == .regular {
                HStack {
                    Button(action: {
                        presentionMode.wrappedValue.dismiss()
                    }, label: {
                        HStack(spacing: -25) {
                            Image(systemName: "chevron.backward")
                                .padding()
                                .foregroundColor(.blue)
                            
                            Text("Back")
                                .padding()
                        }
                    })
                    Spacer()
                }
                
                Text(title)
                    .padding()
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(story)
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            } else {
                VStack {
                    HStack {
                        Button(action: {
                            presentionMode.wrappedValue.dismiss()
                        }, label: {
                            HStack(spacing: -25) {
                                Image(systemName: "chevron.backward")
                                    .padding()
                                    .foregroundColor(.blue)
                                
                                Text("Back")
                                    .padding()
                            }
                        })
                        Spacer()
                    }
                    
                    Text(title)
                        .padding()
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            Text(story)
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .background(Color(red: 255/250.0, green: 244/250.0, blue: 234/250.0))
    }
}

#Preview {
    StoryView(
        title: .constant("Winnie the Pooh"),
        story: .constant("")
    )
}
