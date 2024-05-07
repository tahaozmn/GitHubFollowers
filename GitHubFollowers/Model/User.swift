//
//  User.swift
//  GitHubFollowers
//
//  Created by Taha Özmen on 29.04.2024.
//

import UIKit

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
