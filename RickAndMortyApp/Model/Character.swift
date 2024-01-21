//
//  Character.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 20/01/24.
//

import Foundation

struct Character: Codable, Identifiable {
    var id = UUID().uuidString
    
    let id_character: Int
    let name, status: String
    let species, type: String
    let gender, image, url: String
    let origin: CharacterOrigin
    let location: CharacterLocation
    let episode: [String]
    
    private enum CodingKeys: String, CodingKey {
        case id_character = "id"
        case name
        case status
        case species
        case type
        case gender
        case image
        case url
        case origin
        case location
        case episode
    }
}
