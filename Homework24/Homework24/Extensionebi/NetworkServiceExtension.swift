//
//  NetworkServiceExtension.swift
//  Homework24
//
//  Created by Nini Bardavelidze on 11.05.24.
//

import Foundation
import SimpleNetworking

// MARK: - Fetching data extension

extension NetworkService: ImageFetchingService {
    
    func fetchData(completion: @escaping (Result<[UnsplashPhoto], any Error>) -> (Void)) {
        let accessKey = "FRLgsPvdQEkGRi5Q3_8Drnq33spU6A4KE--R6SkwSps"
        let urlString = "https://api.unsplash.com/photos/random?count=60&query=filmphotography&client_id=\(accessKey)"
        NetworkService().getData(urlString: urlString, completion: completion)
    }
    
}
