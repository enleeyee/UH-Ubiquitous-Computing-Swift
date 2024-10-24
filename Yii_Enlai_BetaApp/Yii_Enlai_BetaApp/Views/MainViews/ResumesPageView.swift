import SwiftUI

struct Resume: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}

struct ResumesPageView: View {
    let resumes = [
        Resume(title: "Expanded Resume", description: "Full resume of the user"),
        Resume(title: "AI Resume", description: "AI-generated resume")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()
                
                VStack {
                    List(resumes) { resume in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(resume.title)
                                    .font(.headline)
                                    .foregroundColor(.black)
                            }
                            Spacer()
                            NavigationLink(destination: ResumeDetailView(resume: resume)) {
                                Text("View")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .frame(width: 60, height: 30)
                                    .background(CustomColor.LightBlue)
                                    .cornerRadius(10)
                            }
                        }
                        .listRowBackground(CustomColor.Background)
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                    .background(CustomColor.Background)
                }
            }
            .navigationTitle("Resumes")
        }
    }
}

// Destination View when 'View' is pressed
struct ResumeDetailView: View {
    let resume: Resume
    
    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()
            
            VStack {
                Text(resume.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Text("Details about \(resume.title)")
                    .font(.body)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ResumesPageView()
}
