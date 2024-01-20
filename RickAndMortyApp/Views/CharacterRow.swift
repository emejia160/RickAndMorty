//
//  CharacterRow.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//



import SwiftUI

/// Displays a single item from the list in `ContentView`.
struct CharacterRow: View {
    /// The article this row should be showing.
    let character: Character

    var body: some View {
        NavigationLink {
            CharacterDetail(character: character)
        } label: {
            HStack {
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
                .frame(width: 80, height: 80)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 10))

                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.title2.weight(.heavy))
                }
            }
        }
    }
}
