import SwiftUI

struct AIPageView: View {
    @State private var link = ""
    
    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()
            
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
                
                Spacer().frame(height: 10)
                
                Button(action: {
                    // Action for Create Resume button
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
                
                Spacer()
            }
        }
    }
}

#Preview {
    AIPageView()
}
