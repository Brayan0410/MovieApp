//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 22/05/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var upcomingMovies: [Movies]? = []
    @Published var familyMovies: [Movies]?
    @Published var romanceMovies: [Movies]?
    @Published var error: Error?
    
    
    private let apiClient = APIClient()
    
    func getUpcomingMovies() {
        
        apiClient.getDataUpcoming() { result in
            DispatchQueue.main.async {
                
                switch result {
                case.success(let upcomings):
                    self.upcomingMovies = upcomings.results
                    print("Results \(upcomings.self)")
                case.failure(let error):
                    print("Error \(error)")
                }
            }
            
        }
        
    }
    
    func getFamilyMovies() {
        apiClient.getFamilyGender() { [weak self ]  result in
            DispatchQueue.main.async {
                switch result {
                case.success(let familyGender):
                    self?.familyMovies = familyGender.results ?? []
                    
                    print("Results \(familyGender.self)")
                case.failure(let error):
                    print("Error \(error)")
                }
            }
            
        }
        
    }

    func getRomanceMovies() {
        apiClient.getRomanceGender() { [weak self ] result in
            DispatchQueue.main.async {
                switch result {
                case.success(let romanceGender):
                    self?.romanceMovies = romanceGender.results ?? []
                    print("Results \(romanceGender.self)")
                case.failure(let error):
                    print("Error \(error)")
                }
            }
            
        }
        
    }
    
    
}
