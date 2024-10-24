import SwiftUI
import UniformTypeIdentifiers

struct ResumeUploadView: View {
    @State private var droppedFileURL: URL? = nil
    @State private var isShowingDocumentPicker = false
    @State private var uploadErrorMessage: String? = nil
    @State private var isResumeUploaded = false

    var body: some View {
        if isResumeUploaded {
            MainTabView()
        } else {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Button(action: {
                        isShowingDocumentPicker = true
                    }) {
                        ZStack {
                            Rectangle()
                                .fill(CustomColor.LightBlue)
                                .frame(width: 350, height: 350)
                                .cornerRadius(20)
                                .overlay(
                                    VStack {
                                        Image(systemName: "doc.fill")
                                            .resizable()
                                            .frame(width: 50, height: 70)
                                            .foregroundColor(.white)
                                        Text("Upload PDF resume file here")
                                            .foregroundColor(.white)
                                            .font(.headline)
                                    }
                                )
                        }
                    }
                    .fileImporter(
                        isPresented: $isShowingDocumentPicker,
                        allowedContentTypes: [.pdf],
                        allowsMultipleSelection: false
                    ) { result in
                        do {
                            if let selectedFile = try result.get().first {
                                if selectedFile.pathExtension.lowercased() == "pdf" {
                                    droppedFileURL = selectedFile
                                    print("Upload successful")
                                    isResumeUploaded = true
                                } else {
                                    uploadErrorMessage = "Please upload a valid PDF file."
                                    print("Error: Invalid file format.")
                                }
                            }
                        } catch {
                            uploadErrorMessage = "Error selecting file: \(error.localizedDescription)"
                            print("Error selecting file: \(error.localizedDescription)")
                        }
                    }

                    if let errorMessage = uploadErrorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }

                    if let fileURL = droppedFileURL {
                        Text("Uploaded file: \(fileURL.lastPathComponent)")
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }

                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ResumeUploadView()
}
