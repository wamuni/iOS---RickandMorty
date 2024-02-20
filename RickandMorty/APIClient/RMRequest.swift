//
//  RMRequest.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import Foundation

/// Object represents a single API call
final class RMRequest {
    private struct Constant {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: RMEndpoint
    private let pathComponent: [String]
    private let queryParameter: [URLQueryItem]
    
    /// Constructed URL for api request in string format, computed variable
    private var urlString: String {
        var urlString = Constant.baseUrl
        urlString += "/"
        urlString += endpoint.rawValue
        
        if !pathComponent.isEmpty {
            pathComponent.forEach({
                urlString += "/\($0)"
            })
        }
        
        if !queryParameter.isEmpty {
            urlString += "?"
            
            let argumentString = queryParameter.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            urlString += argumentString
        }
        
        return urlString
        
    }
    
    /// Convert urlString to URL
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public init(
        endpoint: RMEndpoint,
        pathComponent: [String] = [],
        queryParameter: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponent = pathComponent
        self.queryParameter = queryParameter
    }
    
    /// https://rickandmortyapi.com/api/character/2
}
