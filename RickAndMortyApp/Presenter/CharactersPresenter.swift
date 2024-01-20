//
//  CharactersPresenter.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol CharactersPresenterProtocol: AnyObject {
    func fetchCharacters()
}

protocol CharactersPresenterDelegate {
    func loadCharacters(characters: [Character])
}

class CharactersPresenter: CharactersPresenterProtocol {
    
    private  var delegate: CharactersPresenterDelegate?
    private var charactersResponse: CharactersResponse?
    
    init(delegate: CharactersPresenterDelegate?) {
        self.delegate = delegate
    }
    
    func fetchCharacters() {
        let url = "https://rickandmortyapi.com/api/character";
              AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response{ resp in
                    switch resp.result{
                      case .success(let data):
                        do{
                            let dataResponse = try JSON(data: resp.data!)
                                print(dataResponse)
                            }
                            catch{
                            print("JSON Error")
                            }
                        do{
                          let jsonData = try JSONDecoder().decode(CharactersResponse.self, from: resp.data!)
                            self.delegate?.loadCharacters(characters: jsonData.results)
                       } catch {
                          print(error.localizedDescription)
                       }
                     case .failure(let error):
                       print(error.localizedDescription)
                     }
                }
       
    }
        
}

