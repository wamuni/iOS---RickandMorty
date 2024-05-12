//
//  RMInfo.swift
//  RickandMorty
//
//  Created by 潘博石 on 12/05/2024.
//

import Foundation

struct RMInfo: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
