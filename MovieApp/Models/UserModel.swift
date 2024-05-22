//
//  UserModel.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 22/05/24.
//

import Foundation

struct User {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    
    func asDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "email": email,
            "joined": joined
        ]
    }
}
