//
//  CharacterLocation.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 21/01/24.
//

import Foundation

// MARK: - Character Location
struct CharacterLocation: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

