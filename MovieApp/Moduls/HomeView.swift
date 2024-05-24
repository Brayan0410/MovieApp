//
//  HomeView.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 21/05/24.
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModelHV = HomeViewModel()
   
  
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Home")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                        .padding(.top,80)
                        .padding(.trailing, 20)
                    
                    Spacer()
                    ButtonMenu()
                        .padding(.top, 80)
                        .padding(.trailing, 20)
                }
                
                ScrollView(.vertical) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Upcoming")
                            .foregroundStyle(.white)
                            .padding(.trailing, 250)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach (viewModelHV.upcomingMovies ?? [] , id: \.id) { movieResult in
                                    
                                    MovieCardView(movie: movieResult)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }.font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Family")
                            .foregroundStyle(.white)
//                            .padding(.trailing, 200)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach (viewModelHV.familyMovies ?? [], id: \.id) { movieResult2 in
                                    
                                    MovieCardView(movie: movieResult2 )
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }.font(.title2)
                        .bold()
                    
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Romance")
                            .foregroundStyle(.white)
//                            .padding(.trailing, 200)
                        ScrollView(.horizontal, showsIndicators: true) {
                            HStack {
                                ForEach (viewModelHV.upcomingMovies ?? [] , id: \.id) { movieResult in
                                    
                                    MovieCardView(movie: movieResult)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }.font(.title2)
                        .bold()
                }
            }
//            .background(.black)
            .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.black, Color.blue]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
        
        
        .onAppear {
            viewModelHV.getUpcomingMovies()
            viewModelHV.getFamilyMovies()
        }
    }
}

#Preview {
    HomeView()
}
