//
//  TabBarItem.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/18/24.
//

import UIKit

enum TabBarItem: CaseIterable {
    
    case menu, community, home, calendar, chat
    
    // 선택되지 않은 탭
    var normalItem: UIImage? {
        switch self {
        case .menu:
            return .icMenuInactive
        case .community:
            return .icCommunityInactive
        case .home:
            return .icHomeInactive
        case .calendar:
            return .icCalendarInactive
        case .chat:
            return .icChattingInactive
        }
    }
    
    // 선택된 탭
    var selectedItem: UIImage? {
        switch self {
        case .menu:
            return .icMenuActive
        case .community:
            return .icCommunityActive
        case .home:
            return .icHomeActive
        case .calendar:
            return .icCalendarActive
        case .chat:
            return .icChattingActive
        }
    }
    
    // 탭 별 제목
    var itemTitle: String? {
        switch self {
        case .menu:
            return "메뉴"
        case .community:
            return "커뮤니티"
        case .home:
            return "홈"
        case .calendar:
            return "공고달력"
        case .chat:
            return "채팅"
        }
    }
    
    // 탭 별 전환될 화면 -> 나중에 하나씩 추가
    var targetViewController: UIViewController {
        switch self {
        case .menu:
            return HomeViewController()
        case .community:
            return HomeViewController()
        case .home:
            return HomeViewController()
        case .calendar:
            return HomeViewController()
        case .chat:
            return CustomNavigationController(rootViewController: ChatCertificationInitialViewController())
        }
    }
}
