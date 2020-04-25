//
//  ErrorMessage.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation


enum GFError: String,Error {
    case invalidUsername = "This username is  created invalid request"
    case unableToComplete = "Unable to complete the request , Please check your internet connection"
    case invalidResponse = "invalid response from the server , Please try again."
    case invalidData = "Data received from the server is invalid , Please try again."
    case invalidJson = "unable to decode the JSON , Please try again"
    case unableToFavorite = "There was an error favoriting this user ,Please try again "
    case alreadyInFavorites = "You've already favorited this user. You must REALLY like them!"
    
}
