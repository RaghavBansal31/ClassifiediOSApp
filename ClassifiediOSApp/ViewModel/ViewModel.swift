//
//  ViewModel.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation
import Combine

/*
 The below class is a ViewModel which performs the task of fetching the api call thorugh the network manager (where urlsession was used to make the API call) and the recieved data is decoded using JSON decoder and through data model the data is parsed to the display list in the view. The below class uses Combine which automatically handles asynchronous tasks.
 */

class ViewModel: ObservableObject {
        @Published var dataModel:DataModel?
        @Published var result: [Result] = []
        @Published var customError: NetworkError?
    
        var networkManager:NetworkProtocol
        private var cancelable = Set<AnyCancellable>()
        init(networkManager: NetworkProtocol) {
            self.networkManager = networkManager
        }
    
    func getProductsFromAPI(urlString:String) {
        guard let url = URL(string: urlString) else {
                return
            }
            let request = URLRequest(url: url)

            self.networkManager.dataFromAPI(urlRequest: request, type: DataModel.self)
                // it helps in receiving the data and run on the main thread
                .receive(on: RunLoop.main)
               //  Sink is used to subscribe to a publisher and receive values emitted by that publisher
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Task finished")
                        print(self.result)
                    case .failure(let error):
                        print(error.localizedDescription)
                                    switch error{
                                    case is DecodingError:
                                        self.customError = NetworkError.parsingError
                        
                                    case NetworkError.doNotFoundError:
                                        self.customError = NetworkError.doNotFoundError
                        
                                    case NetworkError.inValidError:
                                        self.customError = NetworkError.inValidError
                        
                                    default:
                                        self.customError = NetworkError.doNotFoundError
                                    }
                    }
                }, receiveValue:{ val in
                    self.dataModel = val
                    guard let result = self.dataModel?.results else {
                        return
                        
                    }
                    self.result = result.sorted(by: { $0.name < $1.name })
                    print(self.result)
                    
                }).store(in: &cancelable)
                  /* Cancellable helps in managing the subscriptions made to the publisher which helps in preventing memory leaks and controlling the flow of data */
                
        }
}







///*
// The below class is a ViewModel which performs the task of fetching the api call thorugh the network manager (where urlsession was used to make the API call) and the recieved data is decoded using JSON decoder and through data model the data is parsed to the display list in the view. The below class uses Await and Async.
// */
//
//
//@MainActor
//class ViewModel: ObservableObject {
//    
//    @Published var dataModel:DataModel?
//    @Published var result: [Result] = []
//    @Published var customError: NetworkError?
//    
//    var networkManager:NetworkProtocol
//    init(networkManager: NetworkProtocol) {
//        self.networkManager = networkManager
//    }
//    
//    func getProductsFromAPI() async{
//        guard let url =  URL(string: API.UserAPI)else{
//            return
//        }
//        
//        let  urlRequest = URLRequest(url: url)
//        
//        do{
//            self.dataModel = try await self.networkManager.dataFromAPI(urlRequest: urlRequest)
//            guard let result = self.dataModel?.results else {
//                return
//            }
//            self.result = result
//            print(self.result)
//            
//        }catch
//            let error{
//            print(error.localizedDescription)
//            switch error{
//            case is DecodingError:
//                customError = NetworkError.parsingError
//                
//            case NetworkError.doNotFoundError:
//                customError = NetworkError.doNotFoundError
//                
//            case NetworkError.inValidError:
//                customError = NetworkError.inValidError
//                
//            default:
//                customError = NetworkError.doNotFoundError
//            }
//            
//            
//            
//        }
//    }
//}
