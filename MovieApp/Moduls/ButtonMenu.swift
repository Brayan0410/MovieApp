//
//  Button1.swift
//  MovieApp
//
//  Created by Daniela Ciciliano on 22/05/24.
//

import SwiftUI

struct ButtonMenu: View {
    var body: some View {
       
            Button(action: {
                //Acción para acceder al perfil de usuario
               
            }) {
                Image(systemName: "text.alignright")
                    .font(.system(size: 20))
                    .foregroundStyle(.pink)
                    .padding(.top)
                    .offset(CGSize(width: -20, height: 20))
            }
        
        
        
        }
        
    }


#Preview {
    Button1()
}
