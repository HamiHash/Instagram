//
//  LoginView.swift
//  Instagram
//
//  Created by Hamed Hashemi on 9/14/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                // Logo
                Image("Instagram")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                
                // Inputs
                VStack {
                    TextField("Enter your Email" , text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(GrayTextFieldModifier())
                    
                    SecureField("Enter your Password" , text: $password)
                        .modifier(GrayTextFieldModifier())
                }
                
                // Forgot Password
                Button {
                    
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing, 30)
                }
                
                
                Button {
                    Task {
                        try await login()
                    }
                } label: {
                    Text("Login")
                        .modifier(BlueButtonModifier())
                }
                
                Spacer()
                Divider()
                
                // Sign Up
                NavigationLink {
                    InsertEmailView()
                } label: {
                    HStack {
                        Text("Don't have an account? ") + Text("Sign Up").fontWeight(.bold)
                    }
                    .font(.footnote)
                    .foregroundColor(Color(.systemBlue))
                    .padding(.bottom, 10)
                }
            }
        }
    }
}

extension LoginView {
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
