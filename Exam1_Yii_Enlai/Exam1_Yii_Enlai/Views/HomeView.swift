//
//  HomeView.swift
//  Exam1_Yii_Enlai
//
//  Created by Enlai Yii on 9/19/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var winnieStory: String = """
In the heart of the Hundred Acre Wood lived a lovable bear named Winnie the Pooh. Pooh had a single passion in life—honey. He spent his days dreaming of honey pots and finding creative ways to get his paws on more. One day, Pooh discovered that his honey supply was running low, and he enlisted his friends Piglet, Tigger, Eeyore, and Rabbit to help him find more.

As they journeyed through the forest, they faced various challenges, including a tricky maze and a surprising rainstorm. Despite these obstacles, the friends worked together, using their unique skills to solve problems and support one another. Through their teamwork, they learned valuable lessons about cooperation and the joy of sharing.

In the end, Pooh didn’t find as much honey as he hoped, but he gained something far more important—a deeper appreciation for his friends and the time spent together. They celebrated their adventure with a small pot of honey and a big picnic, discovering that the true sweetness of life comes from the bonds we share with those we care about.
"""
    @State private var dumboStory: String = """
Dumbo was a baby elephant born at a traveling circus, and his enormous ears made him quite different from the other elephants. While his large ears allowed him to hear things from far away, they also led to teasing and jokes from the other animals. Dumbo felt sad and lonely, but he had a faithful friend in Timothy the mouse, who always encouraged him to be himself.

One day, while trying to find his place in the circus, Dumbo discovered that his large ears could help him fly. With Timothy’s support and a little practice, Dumbo learned to soar through the air with grace and agility. His flying ability amazed everyone, and he quickly became the star of the circus, performing daring aerial feats that delighted the audience.

Dumbo’s newfound talent not only brought him fame but also taught him an important lesson: what makes us different can be our greatest strength. With Timothy’s unwavering friendship and his own courage, Dumbo embraced who he was and showed the world that being unique is something to be celebrated.

"""
    @State private var pinocchioStory: String = """
Once upon a time, there lived an old woodcarver named Geppetto, who dreamed of having a son. One day, he carved a puppet out of wood and named him Pinocchio. As Geppetto admired his work, something magical happened—the puppet came to life!

Though he could walk and talk, Pinocchio was still made of wood. A kind fairy appeared and told him, "If you prove yourself brave, truthful, and unselfish, you may become a real boy." But there was one catch: whenever Pinocchio told a lie, his nose would grow longer.

Pinocchio was excited about his new life but soon found himself in trouble. He promised Geppetto he’d go to school, but instead, he got distracted by a pair of mischievous boys. They convinced him to skip class and go to a place called Pleasure Island, where they could do anything they wanted. Pinocchio, eager for fun, lied about his plans and his nose grew as long as a branch.

On the island, everything seemed like a dream—until the boys started turning into donkeys as punishment for their bad behavior. Horrified, Pinocchio ran away but got caught in a trap. Thankfully, the fairy appeared and rescued him, reminding him of his promise to be good.

Ashamed, Pinocchio returned home to find Geppetto had gone searching for him and was swallowed by a giant whale! Filled with guilt, Pinocchio dived into the ocean to save his father. Inside the whale, they worked together to escape by making the whale sneeze them out.

Finally, the fairy appeared again, proud of Pinocchio’s bravery and selflessness. With a wave of her wand, she transformed him into a real boy, and Geppetto's wish came true. From that day on, Pinocchio was always truthful and kind, living happily with his father.

And so, they lived happily ever after, in a little house filled with love and laughter.
"""
    @State private var helloKittyStory: String = """
Hello Kitty, a cheerful little kitten with a big red bow, lived in a cozy village where she was loved by everyone. One day, her dear friend My Melody asked for help to organize a surprise birthday party. Hello Kitty was thrilled to assist and immediately began planning the perfect celebration. She enlisted her friends Keroppi, Badtz-Maru, and Cinnamoroll to help with preparations.

The team worked tirelessly to bake a delicious cake, decorate the garden with colorful balloons, and plan fun games and activities. Despite a few minor hiccups along the way, including a mix-up with the party hats and a brief rain shower, Hello Kitty and her friends managed to pull off a wonderful party. My Melody was overjoyed, and the party was filled with laughter, games, and delicious treats.

Hello Kitty realized that the true joy of the party wasn’t just in the decorations or the cake, but in the effort and love that went into making My Melody’s day special. She learned that working together and making others happy was the best reward of all, and the experience brought her even closer to her friends.
"""
    
    @Binding var winnieRate: Double
    @Binding var dumboRate: Double
    @Binding var pinocchioRate: Double
    @Binding var helloKittyRate: Double
    
    @State private var isWinnieStarFilled: Bool = false
    @State private var isDumboStarFilled: Bool = false
    @State private var isPinocchioStarFilled: Bool = false
    @State private var isHelloKittyStarFilled: Bool = false
    
    @State private var isStorySheetPresented: Bool = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        VStack {
            
            if verticalSizeClass == .regular {
                VStack {
                    Text("STORY TIME")
                        .padding()
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("Winnie the Pooth")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isWinnieStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isWinnieStarFilled.toggle()
                                    }
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Winnie")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Winnie the Pooh"),
                                    story: $winnieStory
                                )
                            }
                            
                            Text("Rating: \(Text($winnieRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $winnieRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Dumbo")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isDumboStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isDumboStarFilled.toggle()
                                    }
                                
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Dumbo")
                                    .resizable()
                                    .background(.white)
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Dumbo"),
                                    story: $dumboStory
                                )
                            }
                            
                            Text("Rating: \(Text($dumboRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $dumboRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("Pinocchio")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isPinocchioStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPinocchioStarFilled.toggle()
                                    }
                                
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Pinocchio")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Pinocchio"),
                                    story: $pinocchioStory
                                )
                            }
                            
                            Text("Rating: \(Text($pinocchioRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $pinocchioRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Hello Kitty")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isWinnieStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isWinnieStarFilled.toggle()
                                    }                    }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("HelloKitty")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Hello Kitty"),
                                    story: $helloKittyStory
                                )
                            }
                            
                            Text("Rating: \(Text($helloKittyRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $helloKittyRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                    }
                    Spacer()
                }
            } else {
                VStack {
                    Text("STORY TIME")
                        .padding()
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("Winnie the Pooth")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isWinnieStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isWinnieStarFilled.toggle()
                                    }
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Winnie")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Winnie the Pooh"),
                                    story: $winnieStory
                                )
                            }
                            
                            Text("Rating: \(Text($winnieRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $winnieRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Dumbo")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isDumboStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isDumboStarFilled.toggle()
                                    }
                                
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Dumbo")
                                    .resizable()
                                    .background(.white)
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Dumbo"),
                                    story: $dumboStory
                                )
                            }
                            
                            Text("Rating: \(Text($dumboRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $dumboRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Pinocchio")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isPinocchioStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPinocchioStarFilled.toggle()
                                    }
                                
                            }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("Pinocchio")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Pinocchio"),
                                    story: $pinocchioStory
                                )
                            }
                            
                            Text("Rating: \(Text($pinocchioRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $pinocchioRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                        
                        Spacer()
                        
                        VStack {
                            HStack {
                                Text("Hello Kitty")
                                    .font(.system(size: 15))
                                    .foregroundColor(Color(red: 126/250.0, green: 172/250.0, blue: 181/250.0))
                                
                                Image(systemName: isWinnieStarFilled ? "star.fill" : "star")
                                    .font(.system(size: 15))
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isWinnieStarFilled.toggle()
                                    }                    }
                            
                            Button(action: {
                                isStorySheetPresented = true
                            }) {
                                Image("HelloKitty")
                                    .resizable()
                                    .frame(width: 150, height: 150)
                            }
                            .sheet(isPresented: $isStorySheetPresented) {
                                StoryView(
                                    title: .constant("Hello Kitty"),
                                    story: $helloKittyStory
                                )
                            }
                            
                            Text("Rating: \(Text($helloKittyRate.wrappedValue == 0 ? "--" : "\(String(format: "%.0f", $helloKittyRate.wrappedValue))%"))")
                                .padding()
                                .background(Color(red: 201/250.0, green: 104/250.0, blue: 104/250.0))
                                .foregroundColor(.white)
                                .cornerRadius(10.0)
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .background(Color(red: 255/250.0, green: 244/250.0, blue: 234/250.0))
        .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
        }
    }
}

#Preview {
    HomeView(winnieRate: .constant(0), dumboRate: .constant(0), pinocchioRate: .constant(0), helloKittyRate: .constant(0))
}
