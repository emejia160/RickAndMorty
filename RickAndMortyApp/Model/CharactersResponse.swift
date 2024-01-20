//
//  CharactersResponse.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import Foundation

struct CharactersResponse: Codable, Identifiable {
    var id = UUID().uuidString
    
    let info: Info
    let results: [Character]
    
    private enum CodingKeys: String, CodingKey {
        case info
        case results
    }
}

// MARK: - CharacterResponse Info
struct Info: Codable, Identifiable {
    var id = UUID().uuidString
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case pages
        case next
        case prev
    }
}
