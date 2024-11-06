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
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.bottom, 20)

                TextField("email address", text: $email)
                    .padding()
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .foregroundColor(CustomColor.dynamicTextColor)

                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                    } else {
                        SecureField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                    }

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(CustomColor.dynamicIconColor)
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
                        .foregroundColor(CustomColor.dynamicTextColor)
                        .background(CustomColor.LightBlue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(CustomColor.dynamicTextColor)

                    Button(action: {
                        showSignUpPage = true
                    }) {
                        Text("Sign Up")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(CustomColor.dynamicTextColor)
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
