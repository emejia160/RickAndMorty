//
//  CharactersRepository.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//
import Alamofire
import SwiftyJSON

class CharactersRepository : CharactersRepositoryProtocol{
    private var charactersResponse: CharactersResponse?
    
    func retrieveCharacters(page: Int, onFinish: @escaping (CharactersResponse) -> Void, onError: @escaping (Error) -> Void) {
        
        let parameters: Parameters = [
                "page": page
                ]
        
        let url = String(Constants.Urls.baseUrl + Constants.Urls.charactersPath);
              AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil, interceptor: nil)
                .response{ resp in
                    switch resp.result{
                    case .success(_):
                        do{
                          let jsonData = try JSONDecoder().decode(CharactersResponse.self, from: resp.data!)
                            self.charactersResponse = jsonData
                            onFinish(self.charactersResponse!)
                       } catch {
                          print(error.localizedDescription)
                       }
                     case .failure(let error):
                       print(error.localizedDescription)
                     }
                }
       
    }
        
}

