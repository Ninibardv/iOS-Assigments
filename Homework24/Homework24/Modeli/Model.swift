//
//  Model.swift
//  Homework24
//
//  Created by Nini Bardavelidze on 11.05.24.
//

import Foundation


struct Images: Identifiable, Codable {
    var id: Int
}

struct UnsplashPhoto: Decodable, Hashable {
    let urls: URLs
}

struct URLs: Decodable, Hashable {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
    let small_s3: String
}
