//
//  getPostListResponse.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import Foundation

struct GetPostListResponse: Codable {
    let posts: [Post]
}

struct Post: Codable {
    let id: Int
    let job: String
    let community: String
    let imageUrl: String
    let title: String
    let content: String
    let writer: String
    let beforeTime: String
    let favorites: Int
    let comments: Int
    let views: Int
}

