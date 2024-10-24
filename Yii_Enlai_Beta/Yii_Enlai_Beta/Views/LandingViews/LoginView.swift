import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordVisible = false
    @State private var showSignUpPage = false
    @State private var showUploadPage = false

    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()

                Image(systemName: "doc.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundColor(CustomColor.BlueGray)
                    .shadow(radius: 4)
                    .padding(.bottom, 40)

                Text("Welcome Back")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)

                TextField("email address", text: $email)
                    .padding()
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)

                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .frame(width: 280, height: 50)
                    } else {
                        SecureField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .frame(width: 280, height: 50)
                    }

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.black)
                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 10)

                Button(action: {
                    showUploadPage = true
                }) {
                    Text("continue")
                        .frame(width: 280, height: 50)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(CustomColor.LightBlue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.black)
                    Button(action: {
                        showSignUpPage = true
                    }) {
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .underline()
                    }
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showUploadPage) {
            ResumeUploadView()
        }
        .fullScreenCover(isPresented: $showSignUpPage) {
            SignUpView()
        }
    }
}

#Preview {
    LoginView()
}
