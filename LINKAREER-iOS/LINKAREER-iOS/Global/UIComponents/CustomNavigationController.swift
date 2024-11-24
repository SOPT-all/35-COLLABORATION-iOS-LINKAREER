//
//  CustomNavigationController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/23/24.
//

import UIKit

import Then
import SnapKit

final class CustomNavigationController: UINavigationController {
    
    private let linkareerIcon: UIImageView = UIImageView()
    
    private let iconStackView: UIStackView = UIStackView()
    private let calendarIcon: UIImageView = UIImageView()
    private let alarmIcon: UIImageView = UIImageView()
    private let bookmarkIcon: UIImageView = UIImageView()
    private let chatIcon: UIImageView = UIImageView()
    
    override func viewDidLoad() {
        
        setHierarchy()
        setLayout()
        setStyle()
    }
}


extension CustomNavigationController {
    func setHierarchy() {
        iconStackView.addArrangedSubviews(calendarIcon, alarmIcon, bookmarkIcon, chatIcon)
        navigationBar.addSubviews(linkareerIcon, iconStackView)
    }
    
    func setLayout() {
        linkareerIcon.snp.makeConstraints {
            $0.top.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(14)
        }
        
        iconStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalToSuperview().inset(14)
        }
        
    }
    
    func setStyle() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lkBlue
        appearance.shadowColor = nil
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
        self.navigationBar.isTranslucent = false
        
        linkareerIcon.image = .imgLogo
        calendarIcon.image = .icCalendarW36
        alarmIcon.image = .icNoticeWDefault
        bookmarkIcon.image = .icBookmarkWDefault
        chatIcon.image = .icChattingB
        
        iconStackView.do {
            $0.axis = .horizontal
            $0.spacing = 0
        }
    }
}
