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
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: 10) {
                        Text("MovieApp")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.white)
                            .bold()
                        
                        Text("Watch a movie and relax")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                    }
                    .padding(.bottom, 10)
                    
                    Spacer()
                    
                    VStack(spacing: 18) {
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                            
                        TextField("Email Address", text: $viewModel.email)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        Button(action: {
                            viewModel.login()
                        }) {
                            Text("Log In")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(10)
                        }
                        
                        // Add NavigationLink for forgotten password
                        NavigationLink("Forgotten your password?", destination: ForgotView())
                            .foregroundColor(.white)
                            .padding(.top, 10)
                    }
                    .padding()
                    
                    VStack {
                        Text("New around here?")
                            .foregroundColor(.white)
                        
                        NavigationLink("Create An Account", destination: RegisterView())
                    }
                    .padding(.bottom, 100)
                    
                    Spacer()
                    
                }
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
