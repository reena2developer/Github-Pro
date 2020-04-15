//
//  User.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct User:Codable {
    
    var login:String
    var avatarUrl:String
    var followersUrl:String
    var followingUrl:String
    var name:String?
    var company:String
    var blog:String
    var location:String?
    var bio:String?
    var publicRepos:Int
    var publicGists:Int
    var htmlUrl:String
    var following:Int
    var followers:Int
    var createdAt:String
}
