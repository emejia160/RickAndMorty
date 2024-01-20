//
//  CharactersPresenter.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import Foundation

protocol CharactersRepositoryProtocol {
    func retrieveCharacters(page: Int, onFinish: @escaping (CharactersResponse) -> Void, onError: @escaping (Error) -> Void)
}

protocol CharactersPresenterProtocol: AnyObject {
    func fetchCharacters(page: Int)
    func shouldLoadMoreCharacters(character: Character) -> Bool
}

protocol CharactersPresenterDelegate {
    func loadCharacters(characters: [Character])
    func onLoadCharactersError()
}

class CharactersPresenter: CharactersPresenterProtocol {
    
    private  var delegate: CharactersPresenterDelegate?
    @Published var characters: [Character] = []
   
    private var charactersRepository: CharactersRepositoryProtocol
    
    init(delegate: CharactersPresenterDelegate?, repository: CharactersRepositoryProtocol = CharactersRepository()) {
        self.delegate = delegate
        self.charactersRepository = repository
    }
    
    func shouldLoadMoreCharacters(character: Character) -> Bool {
        if (character.id_character == self.characters.count - 2) {
            return true
        }
        return false
    }
    
    func fetchCharacters(page: Int) {
        self.charactersRepository.retrieveCharacters(page: page) { response in
            self.characters.append(contentsOf: response.characters)
            self.delegate?.loadCharacters(characters: self.characters)
        } onError: { error in
            self.delegate?.onLoadCharactersError()
        }
          

       
    }
}

