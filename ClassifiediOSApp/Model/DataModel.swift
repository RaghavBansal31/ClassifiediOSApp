//
//  DataModel.swift
//  ClassifiediOSApp
//
//  Created by Raghav Bansal on 9/7/24.
//

import Foundation

// MARK: - DataModel
struct DataModel:Decodable {
    let results: [Result]
}

// MARK: - Result
struct Result: Decodable,Identifiable{
    var id: UUID = UUID()
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    
    // These codingkeys can be used if we want to use a different property name. It can be used for both encoding and decoding.
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}
