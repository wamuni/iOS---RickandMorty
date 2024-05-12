//
//  RMGetAllCharactersResponse.swift
//  RickandMorty
//
//  Created by 潘博石 on 12/05/2024.
//

import Foundation

struct RMGetAllCharactersResponse: Codable {
    let info: RMInfo
    let characters: [RMCharacter]
}
