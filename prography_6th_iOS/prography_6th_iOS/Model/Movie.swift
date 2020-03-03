//
//  Movie.swift
//  prography_6th_iOS
//
//  Created by apple on 2020/03/01.
//  Copyright © 2020 apple. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    var status: String?
    let statusMessege: String?
    let data: DataClass?
    
    enum CodingKeys: String, CodingKey {
        case status, data
        case statusMessege = "status_message"
    }
}

struct DataClass: Codable {
    let movieCount: Int?
    let limit: Int?
    let movies: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case limit, movies
        case movieCount = "movie_count"
    }
}

struct Movie: Codable {
    let title: String?
    let rating: Double?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case title, rating
        case image = "medium_cover_image"
    }
}
