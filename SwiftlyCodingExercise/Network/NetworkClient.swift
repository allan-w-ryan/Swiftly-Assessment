//
//  NetworkClient.swift
//  SwiftlyCodingExercise
//
//  Created by Allan Ryan on 7/31/22.
//

import Foundation
import os

protocol Networking {
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse)
}

extension URLSession : Networking {}

class NetworkClient {
    
    private let networking: Networking
    
    let endpoint: String
    init(endpoint: String, networking: Networking = URLSession.shared) {
        self.networking = networking
        self.endpoint = endpoint
    }
    
    func dispatchCall() async throws -> Data {
        // Build URL - If working in a ecosystem that has dev/stage/prod servers in which all calls need to be made to the same server environment, this is where I'd do that mapping. However, if the overarching server setup allowed for individual calls to be made to individual environments (like a prod authed user being able to hit an in development service hosted in the dev environment) I'd either inject the environment when inititing the NetworkClient instance, have the individual DataFetcher implementations handle it prior to injecting the URL string, or in the event of a global setting somewhere just set it in the init.
        guard let url = URL(string: self.endpoint) else {
            let logger = Logger.init(subsystem: String(describing: self), category: "NETWORK")
            logger.error("Unable to construct URL")
            throw NetworkClientErrors.URL_CONSTRUCTION_ERROR
        }
        
        let (data, _) = try await networking.data(from: url, delegate: nil)
        return data
    }
}
