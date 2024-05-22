//
//  ForgotView.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 22/05/24.
//

import SwiftUI

struct ForgotView: View {
    @StateObject var viewModel = ForgotViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]),
                               startPoint: .top,
                               endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Image(systemName: "lock.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Forgot Password")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)
                    
                    TextField("Email Address", text: $viewModel.email)
                        .padding()
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(10)
                        .autocapitalization(.none)
                        .padding(.horizontal, 40)
                    
                    Button(action: {
                        viewModel.sendPasswordReset { success in
                            // Optionally handle success or failure here if needed
                        }
                    }) {
                        Text("Send Reset Link")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal, 40)
                    }
                    
                    Text(viewModel.message)
                        .foregroundColor(.white)
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ForgotView()
}
