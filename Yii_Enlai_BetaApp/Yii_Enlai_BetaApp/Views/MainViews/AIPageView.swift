import SwiftUI

struct AIPageView: View {
    @State private var link = ""
    @State private var resumePDF: Data?
    @State private var isProcessing = false
    @State private var result = ""
    
    @State private var temperature: Double = 0.7
    @State private var maxTokens: Int = 256
    @State private var frequencyPenalty: Double = 0.0
    @State private var presencePenalty: Double = 0.0
    
    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea(edges: .top)
            
            VStack {
                
                Spacer().frame(height: 30)
                
                Image(systemName: "doc.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundColor(CustomColor.BlueGray)
                    .shadow(radius: 4)
                    .padding(.bottom, 40)
                
                Spacer().frame(height: 10)

                TextField("Add link to job application", text: $link)
                    .padding()
                    .foregroundColor(.black)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 361, height: 52)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                if isProcessing {
                    ProgressView("Creating Resume...")
                        .padding()
                } else {
                    Spacer().frame(height: 10)
                    
                    Button(action: {
                        createResume()
                    }) {
                        Text("Create resume")
                            .fontWeight(.semibold)
                            .padding()
                            .frame(width: 249, height: 50)
                            .background(CustomColor.LightBlue)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    .disabled(!isValidURL(link))
                    .opacity(isValidURL(link) ? 1 : 0.6)
                }
                
                Spacer()
                
                if !result.isEmpty {
                    Text("Generated Resume:")
                        .font(.headline)
                    ScrollView {
                        Text(result)
                            .padding()
                    }
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                }
            }
        }
    }
    
    func createResume() {
        guard !link.isEmpty, let resumePDF = resumePDF else {
            print("Link or resume PDF is missing.")
            return
        }

        isProcessing = true

        let prompt = """
        Based on the user’s pdf resume file, create a resume that is tailored for the job application found in the link: \(link).
        """

        let pdfText = extractTextFromPDF(data: resumePDF)

        let apiClient = ChatGPTAPI(apiKey: "your-api-key")
        let messages = [
            Message(role: "system", content: "You are a resume generator assistant."),
            Message(role: "user", content: prompt),
            Message(role: "user", content: pdfText)
        ]

        apiClient.sendMessage(
            messages: messages,
            temperature: temperature,
            maxTokens: maxTokens,
            frequencyPenalty: frequencyPenalty,
            presencePenalty: presencePenalty
        ) { result in
            DispatchQueue.main.async {
                isProcessing = false
                switch result {
                case .success(let response):
                    self.result = response
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }

    func extractTextFromPDF(data: Data) -> String {
        return "Extracted text from the resume PDF"
    }

    func isValidURL(_ urlString: String) -> Bool {
        guard let url = URL(string: urlString) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
}

#Preview {
    AIPageView()
}
