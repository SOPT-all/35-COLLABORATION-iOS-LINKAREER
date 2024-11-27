//
//  DTO.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/27/24.
//

import Foundation

struct Official: Codable {
    let id: Int
    let interestJob: String
    let imageUrl: String
    let title: String
    let companyName: String
    let tag: String
    let views: Int
    let comments: Int
    let dday: String
    let bookmark: Bool
}

struct OfficialListResponse: Codable {
    let officialList: [Official]
}
