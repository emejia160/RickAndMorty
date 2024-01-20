//
//  CharactersView.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import SwiftUI
import Kingfisher

struct CharactersView: View, CharactersPresenterDelegate {
    
    
    @ObservedObject var charactersContainer = CharactersContainer()
    var presenter: CharactersPresenterProtocol?
    @State private var currentPage: Int = 1
    
    @State private var searchText = ""
    
    
    init() {
        self.presenter = CharactersPresenter(delegate: self)
    }
    
    var body: some View {
            NavigationView {
                VStack{
                    List(filteredCharacters) { character in
                        
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
                        .onAppear {
                            if (presenter!.shouldLoadMoreCharacters(character: character)) {
                                currentPage += 1
                                presenter?.fetchCharacters(page: currentPage)
                            }
                        }
                    }
                    
                } .searchable(text: $searchText, prompt: "Buscar por nombre")
                 }.onAppear {
                    presenter?.fetchCharacters(page: 1)
                }
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return charactersContainer.characters
        } else {
            return charactersContainer.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func loadCharacters(characters: [Character]) {
        self.charactersContainer.characters = characters
    }
    
    func onLoadCharactersError() {
      Alert(title: Text("Error"), message: Text("Error cargando personajes"), dismissButton: .default(Text("Aceptar")))
    }
    
}

class CharactersContainer : ObservableObject{
    @Published var characters = [Character]()
}
