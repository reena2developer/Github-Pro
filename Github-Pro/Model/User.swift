//
//  User.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import Foundation

struct User:Codable {
    
    let login:String
    let avatarUrl:String
    let followersUrl:String
    let followingUrl:String?
    var name:String?
    let company:String?
    let blog:String?
    var location:String?
    var bio:String?
    let publicRepos:Int
    let publicGists:Int
    let htmlUrl:String
    let following:Int
    let followers:Int
    let createdAt:String
}
