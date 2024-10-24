import SwiftUI
import UniformTypeIdentifiers

struct ResumeUploadView: View {
    @State private var isDragging = false
    @State private var droppedFileURL: URL? = nil

    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()

            VStack {
                Spacer()

                ZStack {
                    Rectangle()
                        .fill(isDragging ? CustomColor.WhiteBlue : CustomColor.LightBlue)
                        .frame(width: 350, height: 350)
                        .cornerRadius(20)
                        .overlay(
                            VStack {
                                Image(systemName: "doc.fill")
                                    .resizable()
                                    .frame(width: 50, height: 70)
                                    .foregroundColor(.white)
                                Text("Add your resume here")
                                    .foregroundColor(.white)
                                    .font(.headline)
                            }
                        )
                        .onDrop(of: [.fileURL], delegate: ResumeDropDelegate(isDragging: $isDragging, droppedFileURL: $droppedFileURL))
                }

                if let fileURL = droppedFileURL {
                    Text("Dropped file: \(fileURL.lastPathComponent)")
                        .foregroundColor(.white)
                        .padding(.top, 20)
                }

                Spacer()
            }
        }
    }
}

struct ResumeDropDelegate: DropDelegate {
    @Binding var isDragging: Bool
    @Binding var droppedFileURL: URL?

    func validateDrop(info: DropInfo) -> Bool {
        return info.hasItemsConforming(to: [.fileURL])
    }

    func dropEntered(info: DropInfo) {
        isDragging = true
    }

    func dropExited(info: DropInfo) {
        isDragging = false
    }

    func performDrop(info: DropInfo) -> Bool {
        isDragging = false
        
        guard let item = info.itemProviders(for: [.fileURL]).first else {
            return false
        }

        item.loadItem(forTypeIdentifier: UTType.fileURL.identifier as String, options: nil) { (data, error) in
            DispatchQueue.main.async {
                if let data = data as? Data, let url = URL(dataRepresentation: data, relativeTo: nil) {

                    if url.pathExtension.lowercased() == "pdf" {
                        self.droppedFileURL = url
                    }
                }
            }
        }

        return true
    }
}

#Preview {
    ResumeUploadView()
}
