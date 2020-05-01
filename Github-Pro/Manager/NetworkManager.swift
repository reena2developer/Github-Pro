//
//  NetworkManager.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL  = "https://api.github.com/users/"
    
     let cache    = NSCache<NSString,UIImage>()  // handle singular cache
    
    
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
    
    
    
    func getUserInfo(for  username: String,completed: @escaping (Result<User,GFError>) -> Void){
        
        let endPoint = baseURL + "\(username)"
        
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
                
                print(String(data: data, encoding: String.Encoding.utf8) ?? "")
                
                let  decoder                   = JSONDecoder()
                decoder.keyDecodingStrategy    = .convertFromSnakeCase
                decoder.dateDecodingStrategy   = .iso8601
                let user                       = try decoder.decode(User.self, from: data)
                completed(.success(user))
                
                
            }catch{
               
                completed(.failure(.invalidJson))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void){
        
        let  cacheKey  = NSString(string: urlString)
        
        
        if let image = cache.object(forKey: cacheKey){
            
            completed(image)
            return
        }
        
        
        guard let url = URL(string: urlString) else{
            
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self ,
               error == nil,
              let response = response as? HTTPURLResponse, response.statusCode == 200,
              let data     = data,
              let image    = UIImage(data: data) else {
                  completed(nil)
                  return

            }
            self.cache.setObject(image, forKey: cacheKey)   // download and set the image into the cache menory
            completed(image)
        }
        
        task.resume()
    }
    
    }
    

