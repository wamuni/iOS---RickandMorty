//
//  RMEndpoint.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import Foundation
/// Represents unique API endpoints
@frozen enum RMEndpoint: String {
    /// Endpoint to character info
    case character /// "character"
    /// Endpoint to location info
    case location
    /// Endpoint to episode info
    case episode
}
