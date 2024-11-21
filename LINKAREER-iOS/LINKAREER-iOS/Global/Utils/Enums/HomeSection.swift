//
//  HomeSection.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/20/24.
//

import Foundation

enum HomeSection {
    case homeBanner
    case interestBoard
    case catecoryBoard
    case recommendRecruit
    
    static let dataSource: [HomeSection] = [
        HomeSection.homeBanner,
        HomeSection.interestBoard,
        HomeSection.catecoryBoard,
        HomeSection.recommendRecruit
    ]
}
