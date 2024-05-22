//
//  LoginView.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 21/05/24.
//

import SwiftUI

struct LoginView: View {

@StateObject var viewModel = LoginViewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                (title: "MovieApp",subtitle: "Get things  done",angle: 15, background: .pink)
            
                //login form
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    }
                    .padding()
                }
                .offset(y: -50)
                
                //Create Account
                
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
            }
            Spacer()
            
            }
        }
    
#Preview {
    LoginView()
}
    
