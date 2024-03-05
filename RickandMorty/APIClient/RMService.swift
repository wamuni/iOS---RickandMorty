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
    
    /// Create RMServiceError to handle different error situation
    enum RMServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    /// Send Rick and Morty api call
    /// - Parameter:
    ///     - request: Request instance
    ///     - expecting: the data type we're expecting for the request
    ///     - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest, expecting type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        /// if there is no URLReqest created based on RMRequest, then return the error
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return
        }
        
        /// Use builtin URLSession to execute URL requst
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    /// @name: request
    /// @parameter: from rmRequest: RMRequest
    ///
    /// @return: URLRequest?
    private func request(from rmReqeuest: RMRequest) -> URLRequest? {
        guard let url = rmReqeuest.url else {
            return nil
        }
        var request = URLRequest(url: url)
        request.httpMethod = rmReqeuest.httpsMethod
        return request
    }
}
