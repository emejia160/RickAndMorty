//
//  CharacterRow.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//



import SwiftUI
import Kingfisher

struct CharacterRow: View {
    let character: Character

    var body: some View {
        NavigationLink {
            CharacterDetail(character: character)
        } label: {
            HStack {
                KFImage.url(URL(string: character.image))
                          .loadDiskFileSynchronously()
                          .cacheMemoryOnly()
                          .scaleFactor(2.3)
                          .fade(duration: 0.25)
                          .onProgress { receivedSize, totalSize in  }
                          .onSuccess { result in  }
                          .onFailure { error in }
                          .scaledToFit()
                          .frame(width: 130, height: 130)
                          .clipped()
                          .clipShape(RoundedRectangle(cornerRadius: 5))


                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.title2.weight(.heavy))
                    Text(character.status)
                        .font(.caption.weight(.heavy))
                    Text("Last known location:")
                        .font(.title2.weight(.heavy))
                    Text(character.location.name)
                        .font(.title2.weight(.heavy))
                }
            }
        }
    }
}
