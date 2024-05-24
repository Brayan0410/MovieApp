//
//  Button1.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 22/05/24.
//

import SwiftUI

struct ButtonMenu: View {
        
    
    var body: some View {
        
        
        NavigationLink(destination: ProfileView()) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
        }
    }
}


//#Preview {
//    ButtonMenu(showProfile: .constant(false))
//}
