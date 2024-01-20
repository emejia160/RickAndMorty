//
//  CharactersView.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import SwiftUI

struct CharactersView: View, CharactersPresenterDelegate {
    
    @ObservedObject var charactersContainer = CharactersContainer()
    var presenter: CharactersPresenterProtocol?
    
    @State private var searchText = ""
    
    
    init() {
        self.presenter = CharactersPresenter(delegate: self)
    }
    
    var body: some View {
            NavigationView {
                VStack{
                    List(filteredCharacters,  rowContent: CharacterRow.init)
                    
                } .searchable(text: $searchText)
                
            }.onAppear(perform: presenter?.fetchCharacters)
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
    
}

class CharactersContainer : ObservableObject{
    @Published var characters = [Character]()
}
