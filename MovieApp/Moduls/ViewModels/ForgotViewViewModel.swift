//
//  ForgotViewViewModel.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 22/05/24.
//

import SwiftUI
//import FirebaseAuth

class ForgotViewViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var message: String = ""
    
    func sendPasswordReset(completion: @escaping (Bool) -> Void) {
       // Auth.auth().sendPasswordReset(withEmail: email) { error in
          //  if let error = error {
              //  print("Error sending password reset: \(error.localizedDescription)")
                self.message = "Failed to send password reset link. Please try again."
                completion(false)
        //    } else {
                self.message = "A password reset link has been sent to your email."
                completion(true)
            }
        }
  //  }
//}

