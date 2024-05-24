//
//  ProfileView.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 22/05/24.
//

import SwiftUI
import FirebaseAuth
import PhotosUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewViewModel
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var profileImage: UIImage? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.black, Color.blue]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Profile")
                    .font(.system(size: 60, weight: .bold))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Spacer()
                
                if let user = viewModel.user {
                    if let profileImage = profileImage {
                        Image(uiImage: profileImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }
                    
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
                        Text("Select Profile Photo")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .onChange(of: selectedItem, initial: true) { newItem,arg  in
                        Task {
                            if let data = try? await newItem?.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
                                profileImage = uiImage
                                viewModel.uploadProfileImage(uiImage) { url in
                                    if let url = url {
                                        print("Profile image URL: \(url)")
                                    }
                                }
                            }
                        }
                    }
                    
                    Text(user.name)
                        .font(.title)
                        .foregroundColor(.white)
                        .bold()
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.white)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .scaleEffect(2)
                }
                
                Spacer()
                
                Button(action: {
                    viewModel.logOut()
                }) {
                    Text("Cerrar Sesión")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.8))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .padding(.bottom, 100)
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView(viewModel: ProfileViewViewModel())
}

