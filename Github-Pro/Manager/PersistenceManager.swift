//
//  PersistenceManager.swift
//  Github-Pro
//
//  Created by Developer on 25/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation
enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites  = "favorites"
    }
    
    
    // retriving the followring array from NSuserfeault
    static func retriveFavorites (completed: @escaping (Result<[Follower],GFError>) -> Void){
        
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            
            let  decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
            
            
        }catch{
           
            completed(.failure(.unableToFavorites))
        }
    }
    
    // save favorites follower in nsuserdefault
    
    static func  save(favorites: [Follower]) -> GFError? {
        
        
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
            
            
        } catch {
            return .unableToFavorites
        }
        
    }
}
