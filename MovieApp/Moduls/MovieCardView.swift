//
//  MovieCardView.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 21/05/24.
//

import SwiftUI

struct MovieCardView: View {
    var movie: Movies
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: movie.primaryImage?.url ?? "")) { image in
                    switch image {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 100, height: 150)
                               
                                .cornerRadius(10)
                                .shadow(color: Color.black,radius: 5)
                        
                    case .failure(let error):
                        Image(systemName: "movieclapper")
                    @unknown default:
                        EmptyView()
                    }
                    
                }
            }.padding(.top,10)
            
//                
//            ZStack {
//                Text(movie.primaryImage?.caption?.plainText ?? "")
//                    .foregroundStyle(.white)
//                    .font(.subheadline)
//                    .lineLimit(1, reservesSpace: true)
//                
//            }
        }
    }
}

//    }


//    #Preview {
//        MovieCardView()
//    }
