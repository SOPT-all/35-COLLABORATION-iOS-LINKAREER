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
    
    static var dummyData: [HomeBanner] {
        return [
            HomeBanner(image: .imgMainbanner1347, company: "SAP Korea", title: "SYNC 아카데미 6기 모집 (~11/18(월) 오전 11시 부터 모집이다아", benefit: "1차 서류 프리패스", views: 2000, comment: 16),
            HomeBanner(image: .imgMainbanner2347, company: "SAP Korea", title: "SAP Korea", benefit: "SAP Korea", views: 100, comment: 16),
            HomeBanner(image: .imgMainbanner3347, company: "SAP Korea", title: "SAP Korea", benefit: "SAP Korea", views: 500, comment: 16),
            HomeBanner(image: .imgMainbanner4347, company: "SAP Korea", title: "SAP Korea", benefit: "SAP Korea", views: 5000, comment: 16)
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

struct Board {
    let category: String
    let title: String
    let content: String
    let image: UIImage
    
    static var dummyData: [Board] {
        return [
            Board(category: "면접 합격 후기", title: "하나은행 2차 면접 후기입니다", content: "우선 대기실에 도착하면 안내 분들께서 친절", image: .imgCommuBestNh70),
            Board(category: "면접 합격 후기", title: "하나은행 2차 면접 후기입니다", content: "우선 대기실에 도착하면 안내 분들께서 친절", image: .imgCommuBestNh70),
            Board(category: "면접 합격 후기", title: "하나은행 2차 면접 후기입니다", content: "우선 대기실에 도착하면 안내 분들께서 친절", image: .imgCommuBestNh70),
            Board(category: "면접 합격 후기", title: "하나은행 2차 면접 후기입니다", content: "우선 대기실에 도착하면 안내 분들께서 친절", image: .imgCommuBestNh70),

            Board(category: "면접 합격 후기", title: "하나은행 2차 면접 후기입니다", content: "우선 대기실에 도착하면 안내 분들께서 친절", image: .imgCommuBestNh70)
        ]
    }
}



