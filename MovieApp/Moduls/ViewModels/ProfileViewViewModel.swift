//
//  ProfileViewViewModel.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 22/05/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation
import FirebaseStorage

class ProfileViewViewModel: ObservableObject {
    @Published var user: User? = nil
    
    init() {}
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                )
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
extension ProfileViewViewModel {
    func uploadProfileImage(_ image: UIImage, completion: @escaping (URL?) -> Void) {
        guard let userId = Auth.auth().currentUser?.uid else {
            completion(nil)
            return
        }
        
        let storageRef = Storage.storage().reference().child("profile_images/\(userId).jpg")
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {
            completion(nil)
            return
        }
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Failed to upload image: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Failed to retrieve download URL: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                guard let downloadURL = url else {
                    completion(nil)
                    return
                }
                
                // Save the URL to Firestore
                let db = Firestore.firestore()
                db.collection("users").document(userId).updateData(["profileImageURL": downloadURL.absoluteString]) { error in
                    if let error = error {
                        print("Failed to save profile image URL: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                    completion(downloadURL)
                }
            }
        }
    }
}
