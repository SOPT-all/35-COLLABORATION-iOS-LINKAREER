//
//  HomeModel.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/19/24.
//

import UIKit

struct HomeBanner {
    let image: UIImage
    let company: String
    let title: String
    let benefit: String
    let views: Int
    let comment: Int
    let dDay: Int
    
    
    static var dummyData: [HomeBanner] {
        return [
            HomeBanner(image: .imgMainbanner1347, company: "SAP Korea", title: "SYNC 아카데미 6기 모집 (~11/18(월) 오전 11시 부터 모집이다아", benefit: "1차 서류 프리패스", views: 2810, comment: 0, dDay: 1),
            HomeBanner(image: .imgMainbanner2347, company: "행복나눔재단", title: "2025년 Sunny School 4기 모집", benefit: "활동기간 연구실 제공", views: 9894, comment: 16, dDay: 10),
            HomeBanner(image: .imgMainbanner3347, company: "IT’s DGB, Challenger", title: "제3회 대한민국 디지털 인재 양성 프로젝트 IT’s DGB, iM Challenger", benefit: "수상자 미국 글로벌 기업 견학", views: 344, comment: 0, dDay: 38),
            HomeBanner(image: .imgMainbanner4347, company: "SK하이닉스 청년 Hy-Five", title: "2024년 하반기 sk하이닉스 청년 Hy-Five 12기 모집 (~12/19)", benefit: "정규직 채용 연계", views: 9007, comment: 2, dDay: 35)
        ]
    }
}

struct TagHeader {
    let nickname: String
    let title: String
    let discription: String
    let tags: [String]
    
    
    static var headerData: [TagHeader] {
        return [
            TagHeader(nickname: "앤솝",title: "님이 관심 있을만한 공고", discription: "와(과) 관련 높은 활동이에요.", tags:["연구활동", "부트캠프", "아카데미"]),
            TagHeader(nickname: "앤솝",title: "님과 같은 관심사를 가진 사람들", discription: "에 대한 이야기를 하고 있어요.", tags:["디자인", "UX/UI", "프로덕트 디자인"]),
            TagHeader(nickname: "앤솝",title: "님에게 추천하는 공고", discription: "혜택이 있어요.", tags:["정규직 전환", "체용연계", "1차 프리패스"]),
        ]
    }
}

struct CategorySelector {
    let title: String
    
    static var dummyData: [CategorySelector] {
        return [
            CategorySelector(title: "채용공고"),
            CategorySelector(title: "대외활동")
            
        ]
    }
}

struct Board: Codable {
    let community: String
    let title: String
    let content: String
    let imageUrl: String
    let writer: String
    let createAt: String
    let likeCount: Int
    let commentCount: Int
    let views: Int
}

