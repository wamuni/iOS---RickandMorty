//
//  RMService.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import Foundation

/// Primary api service object to get Rick and Morty data
final class RMService {
    /// Shared singleton instance
    static let shared = RMService()
    /// private constructor
    private init() {}
    
    /// Send Rick and Morty api call
    /// - Parameter:
    ///     - request: Request instance
    ///     - expecting: the data type we're expecting for the request
    ///     - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest, expecting: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
