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
    
    
    func getFollowers(for  username: String ,page: Int, completed: @escaping ([Follower]?,String?) -> Void){
        
        let endPoint = baseURL + "/users/\(username)/followers?per_page =100&page=\(page)"
        
        guard let URL = URL(string: endPoint) else {
            
            completed(nil,"This username is  created invalid request")
            return
        }
        let task = URLSession.shared.dataTask(with: URL) { (data, response, error) in
            if let _ = error{
                completed(nil,"Unable to complete the request , Please check your internet connection")
            }
            
            guard let response  = response as? HTTPURLResponse , response.statusCode == 200 else{
                
                completed(nil,"invalid response from the server , Please try again.")
                return
            }
            
            guard let data  = data else {
                completed(nil, "Data received from the server is invalid , Please try again.")
                return
            }
            
            do {
                
                let  decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers,nil)
                
                
            }catch{
               
                completed(nil,"unable to decode the JSON , Please try again")
            }
        }
        
        task.resume()
    }
}
