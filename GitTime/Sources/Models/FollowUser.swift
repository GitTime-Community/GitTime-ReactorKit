//
//  FollowUser.swift
//  GitTime
//
//  Created by Kanz on 04/06/2019.
//  Copyright © 2019 KanzDevelop. All rights reserved.
//

import Foundation

struct FollowUser: ModelType {
    let id: Int
    let name: String
    let profileURL: String
    let url: String
    let followersURL: String
    let followingURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "login"
        case profileURL = "avatar_url"
        case url = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
    }
}