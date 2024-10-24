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
                    .ignoresSafeArea(edges: .top)
                
                VStack {
                    List(resumes) { resume in
                        HStack {
                            Text(resume.title)
                                .font(.headline)
                                .foregroundColor(.black)
                            
                            NavigationLink(destination: ResumeDetailView(resume: resume)) {
                                EmptyView()
                            }.opacity(0.0)
                            
                            Spacer()
                            
                            Text("View")
                                .font(.headline)
                                .foregroundColor(.black)
                                .frame(width: 60, height: 30)
                                .background(CustomColor.LightBlue)
                                .cornerRadius(10)
                        }
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

struct ResumeDetailView: View {
    let resume: Resume
    
    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea(edges: .top)
            
            VStack {
                Text(resume.title)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                Text("Details about \(resume.title)")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: downloadResume) {
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Download")
                    }
                }
            }
        }
    }
    
    func downloadResume() {
        print("Downloading \(resume.title) as a PDF...")
    }
}

#Preview {
    ResumesPageView()
}
