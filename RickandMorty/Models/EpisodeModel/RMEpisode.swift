//
//  Episode.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
