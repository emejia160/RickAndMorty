//
//  CharacterDetail.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import SwiftUI
import Kingfisher
struct CharacterDetail: View {
    @State var character: Character
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string:character.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Image(systemName: "placeholder")
                }
            }

            VStack(alignment: .leading, spacing: 9) {
                
                Text(character.name)
                    .font(.title)
                Text(NSLocalizedString("status_of_life", comment: ""))
                    .font(.headline.weight(.heavy))
                Text(character.status)
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text(NSLocalizedString("origin", comment: ""))
                    .font(.headline.weight(.heavy))
                Text(character.origin.name)
                    .font(.headline)
                    .foregroundColor(.secondary)

                Divider()

                
                VStack(alignment: .leading) {
                    Text(NSLocalizedString("specie", comment: ""))
                        .font(.headline.weight(.heavy))
                    Text(character.species)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(NSLocalizedString("genre", comment: ""))
                        .font(.headline.weight(.heavy))
                    Text(character.gender)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(NSLocalizedString("last_known_location", comment: ""))
                        .font(.headline.weight(.heavy))
                    Text(character.location.name)
                        .font(.headline)
                        .foregroundColor(.secondary)
                }

               
            }
            .padding(.horizontal)
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

