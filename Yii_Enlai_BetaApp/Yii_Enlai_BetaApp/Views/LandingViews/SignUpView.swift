import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordVisible = false
    @State private var showLoginPage = false
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

                Text("Create your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 20)

                TextField("first name", text: $firstName)
                    .padding()
                    .foregroundColor(.black)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)

                TextField("last name", text: $lastName)
                    .padding()
                    .foregroundColor(.black)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)

                TextField("email address", text: $email)
                    .padding()
                    .foregroundColor(.black)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .frame(width: 280, height: 50)
                            .autocapitalization(.none)
                    } else {
                        SecureField("password", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .foregroundColor(.black)
                            .frame(width: 280, height: 50)
                            .autocapitalization(.none)
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
                    Text("Already have an account?")
                        .foregroundColor(.black)
                    Button(action: {
                        showLoginPage = true
                    }) {
                        Text("Login")
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
        .fullScreenCover(isPresented: $showLoginPage) {
            LoginView()
        }
    }
}

#Preview {
    SignUpView()
}
