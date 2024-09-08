//
//  NetworkError.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation

enum NetworkError:Error{
    
    case inValidError
    case doNotFoundError
    case parsingError
}

extension NetworkError:LocalizedError,Equatable{
    var errorDescription: String?{
        switch self {
            
        case .inValidError:
            return NSLocalizedString("Api EndPoint Wrong", comment: "inValidError")
        case .doNotFoundError:
            return NSLocalizedString("data not found Wrong", comment: "doNotFoundError")
            
        case .parsingError:
            return NSLocalizedString("data not parsed", comment: "parsingError")
        }
    }
}
