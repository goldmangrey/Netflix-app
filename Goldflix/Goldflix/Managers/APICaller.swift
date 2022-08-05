//
//  APICaller.swift
//  Goldflix
//
//  Created by Yeskendir on 04.08.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "d5613c23623a3dd306c79bb4878e68e4"
    static let baseURL = "https://api.themoviedb.org"
}
enum APIError: Error {
    
    case failedTogetData
    
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
            
        }
        task.resume()

    }
    
}
