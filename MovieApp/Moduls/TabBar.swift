//
//  TabBar.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 21/05/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
            
            GendersView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Genders")
                }
        }
        .accentColor(.black)
        .background(
            Color.black.opacity(0.6)
                .edgesIgnoringSafeArea(.all)
        ) 
    }
}

#Preview {
    TabBar()
}
