//
//  CharacterDetail.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import SwiftUI

struct CharacterDetail: View {
    @State var character: Character
    var body: some View {
        VStack {
        
            AsyncImage(url: URL(string: character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "newspaper")
                }
            }
            .frame(width: 500, height: 500)
            .clipped()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}

