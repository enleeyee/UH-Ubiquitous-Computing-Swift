import SwiftUI

struct LandingPageView: View {
    @State private var showSignUpPage = false
    @State private var showLoginPage = false

    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()

            VStack {
                Spacer()

                Image(systemName: "doc.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundColor(CustomColor.BlueGray)
                    .shadow(radius: 4)
                    .padding(.bottom, 40)

                Button(action: {
                    showSignUpPage = true
                }) {
                    Text("Sign up")
                        .frame(width: 165, height: 48)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(CustomColor.LightBlue)
                        .cornerRadius(20)
                }
                .padding(.bottom, 10)

                Button(action: {
                    showLoginPage = true
                }) {
                    Text("Login")
                        .frame(width: 165, height: 48)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(CustomColor.LightBlue)
                        .cornerRadius(20)
                }

                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showSignUpPage) {
            SignUpView()
        }
        .fullScreenCover(isPresented: $showLoginPage) {
            LoginView()
        }
    }
}

#Preview {
    LandingPageView()
}
