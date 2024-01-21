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
    @State private var showingAlertError = false
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
                                    Text(character.status + " - ")
                                        .font(.subheadline.weight(.semibold))
                                        .foregroundColor(character.status == "Alive" ? .green : character.status == "Dead" ? .red : .gray)
                                    + Text(character.species)
                                        .font(.subheadline.weight(.medium))
                                    Text(NSLocalizedString("last_known_location", comment: ""))
                                        .font(.subheadline.weight(.light))
                                    Text(character.location.name)
                                        .font(.subheadline.weight(.medium))
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
                    
                }.alert(isPresented: $showingAlertError, content: {
                    Alert(title: Text(NSLocalizedString("error_message", comment: "")), message: Text(NSLocalizedString("error_message_loading_characters", comment: "")), dismissButton: .default(Text(NSLocalizedString("accept_button", comment: ""))))
                })
                .searchable(text: $searchText, prompt: NSLocalizedString("search_by_name", comment: ""))
                 }.onAppear {
                    presenter?.fetchCharacters(page: 1)
                }
    }
    
    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return charactersContainer.characters
        } else {
            return charactersContainer.characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.species.localizedStandardContains(searchText) || $0.status.localizedStandardContains(searchText)}
        }
    }
    
    func loadCharacters(characters: [Character]) {
        self.charactersContainer.characters = characters
    }
    
    func onLoadCharactersError() {
        self.showingAlertError = true
      
    }
    
}

class CharactersContainer : ObservableObject{
    @Published var characters = [Character]()
}
