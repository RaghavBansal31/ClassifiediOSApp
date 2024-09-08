//
//  NetworkProtocol.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation
import Combine

// This is protocol for Combine
protocol NetworkProtocol{
    func dataFromAPI<T: Decodable>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> where T: Decodable
}





//// This protocol is for Async/Await
//protocol NetworkProtocol{
//    func dataFromAPI<T:Decodable>(urlRequest: URLRequest) async throws -> T
//
//}
