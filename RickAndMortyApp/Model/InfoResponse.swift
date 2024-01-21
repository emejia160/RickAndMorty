//
//  InfoResponse.swift
//  RickAndMortyApp
//
//  Created by Edison Mejia Estrada on 21/01/24.
//

import Foundation

// MARK: - CharacterResponse Info
struct InfoResponse: Codable, Identifiable {
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
