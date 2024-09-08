//
//  NetworkManager.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation
import Combine

//- Conforming protocol in NetworkProtocol File
class NetworkManager:NetworkProtocol{
    func dataFromAPI<T>(urlRequest: URLRequest, type: T.Type) -> AnyPublisher<T, Error> where T : Decodable {
            return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap({ (data: Data, response: URLResponse) in
                    guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                        throw NetworkError.inValidError
                    }
                    return data
                })
                .delay(for: .seconds(3), scheduler: DispatchQueue.main)
                .decode(type: type.self, decoder: JSONDecoder()) // - Parsing
                .eraseToAnyPublisher()
        }
}





///* This is Network Manager to make API call using Async/Await and once the API call is made an Async/Await method will decode the data
//    using JSON decoder and interact with the data model to display data in the View
// */
//
//// - Conforming protocol in NetworkProtocol File
//class NetworkManager:NetworkProtocol{
//    //- Using function below to parse the urlRequest and get it returned by decoding it in JSON format in generic type
//    func dataFromAPI<T:Decodable>(urlRequest: URLRequest) async throws -> T {
//        let (data,response) =  try await URLSession.shared.data(for: urlRequest)
//        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
//            throw NetworkError.inValidError
//        }
//        
//        return try JSONDecoder().decode(T.self, from: data)
//        
//    }
//}
//    
