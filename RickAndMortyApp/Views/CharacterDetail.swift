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
            KFImage.url(URL(string: character.image))
                      .loadDiskFileSynchronously()
                      .fade(duration: 0.25)
                      .onProgress { receivedSize, totalSize in  }
                      .onSuccess { result in  }
                      .onFailure { error in }
                      .frame(width: 350, height: 150)
                      .scaledToFill()
                      .clipped()

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

