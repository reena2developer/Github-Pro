//
//  NetworkManager.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation


class NetworkManager {
    
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    
    
    private init() {}
    
    
    func getFollowers(for  username: String ,page: Int, completed: @escaping (Result<[Follower],GFError>) -> Void){
        
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let URL = URL(string: endPoint) else {
            

            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: URL) { (data, response, error) in
            if let _ = error{
                completed(.failure(.unableToComplete))
            }
            
            guard let response  = response as? HTTPURLResponse , response.statusCode == 200 else{
                
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data  = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                
                let  decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
                
                
            }catch{
               
                completed(.failure(.invalidJson))
            }
        }
        
        task.resume()
    }
}
