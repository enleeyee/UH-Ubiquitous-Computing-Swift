//
//  RatingView.swift
//  Exam1_Yii_Enlai
//
//  Created by Enlai Yii on 9/19/24.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var winnieRate: Double
    @Binding var dumboRate: Double
    @Binding var pinocchioRate: Double
    @Binding var helloKittyRate: Double
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
        VStack {
            
            if verticalSizeClass == .regular {
                Text("Story Ratings")
                    .padding()
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                
                Spacer()
                
                VStack {
                    Text("Winnie the Pooh")
                        .padding()
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    Slider(value: $winnieRate, in: 0...100, step: 1)
                        .padding(.horizontal, 10)
                    
                    Text("\(Int(winnieRate))%")
                        .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                }
                
                Spacer()
                
                VStack {
                    Text("Dumbo")
                        .padding()
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    Slider(value: $dumboRate, in: 0...100, step: 1)
                        .padding(.horizontal, 10)
                    
                    Text("\(Int(dumboRate))%")
                        .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                }
                
                Spacer()
                
                VStack {
                    Text("Pinocchio")
                        .padding()
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    Slider(value: $pinocchioRate, in: 0...100, step: 1)
                        .padding(.horizontal, 10)
                    
                    Text("\(Int(pinocchioRate))%")
                        .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                }
                
                Spacer()
                
                VStack {
                    Text("Hello Kitty")
                        .padding()
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    Slider(value: $helloKittyRate, in: 0...100, step: 1)
                        .padding(.horizontal, 10)
                    
                    Text("\(Int(helloKittyRate))%")
                        .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                }
                
                Spacer()
            } else {
                VStack {
                    Text("Story Ratings")
                        .padding()
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            Text("Winnie the Pooh")
                                .padding()
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                            Slider(value: $winnieRate, in: 0...100, step: 1)
                                .padding(.horizontal, 5)
                            
                            Text("\(Int(winnieRate))%")
                                .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                        }
                        
                        VStack {
                            Text("Dumbo")
                                .padding()
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                            Slider(value: $dumboRate, in: 0...100, step: 1)
                                .padding(.horizontal, 5)
                            
                            Text("\(Int(dumboRate))%")
                                .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                        }
                        
                        VStack {
                            Text("Pinocchio")
                                .padding()
                                .font(.title3)
                                .bold()
                                .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                            Slider(value: $pinocchioRate, in: 0...100, step: 1)
                                .padding(.horizontal, 5)
                            
                            Text("\(Int(pinocchioRate))%")
                                .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                        }
                    }
                    
                    VStack {
                        Text("Hello Kitty")
                            .padding()
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                        Slider(value: $helloKittyRate, in: 0...100, step: 1)
                            .padding(.horizontal, 5)
                        
                        Text("\(Int(helloKittyRate))%")
                            .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                    }
                }

            }
        }
        .padding()
        .background(Color(red: 255/250.0, green: 244/250.0, blue: 234/250.0))
        .tabItem {
            Image(systemName: "slider.horizontal.3")
            Text("Ratings")
        }
    }
}

#Preview {
    RatingView(winnieRate: .constant(0), dumboRate: .constant(0), pinocchioRate: .constant(0), helloKittyRate: .constant(0))
}
