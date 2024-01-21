//
//  CharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import Foundation

struct CharactersResponse: Codable, Identifiable {
    var id = UUID().uuidString
    
    let info: InfoResponse
    let characters: [Character]
    
    private enum CodingKeys: String, CodingKey {
        case info
        case characters = "results"
    }
}

