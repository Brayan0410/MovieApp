//
//  APIClient.swift
//  MovieApp
//
//  Created by Luis Gutierrez on 21/05/24.
//

import Foundation

class APIClient {
    
    func getDataUpcoming(completion: @escaping (Result<MovieModel,Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        
        var request = URLRequest(url:URL(string: "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
    
    func getFamilyGender(completion: @escaping (Result<MovieModel,Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        
        var request = URLRequest(url:URL(string: "https://moviesdatabase.p.rapidapi.com/titles?genre=Family")!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
    
    func getRomanceGender(completion: @escaping (Result<MovieModel,Error>) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        
        var request = URLRequest(url:URL(string: "https://moviesdatabase.p.rapidapi.com/titles?genre=Romance")!, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
    
    
}
