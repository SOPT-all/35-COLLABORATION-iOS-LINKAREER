//
//  CustomSearchView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/24/24.
//

import UIKit

import Then
import SnapKit

final class CustomSearchView: UIView {
    
    private let searchButton: UIButton = UIButton()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CustomSearchView {
    func setHierarchy() {
        addSubview(searchButton)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.height.equalTo(57)
        }
        
        searchButton.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 28)
            $0.height.equalTo(40)
            $0.center.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.do {
            $0.backgroundColor = .lkBlue
        }
        
        searchButton.do {
            $0.setImage(.icSearch24, for: .normal)
            $0.setTitle("대외활동, 인턴, 채용 정보를 검색해보세요", for: .normal)
            $0.setTitleColor(.gray600, for: .normal)
            $0.titleLabel?.font = fontStyle.body8_m_13.font()
            $0.layer.cornerRadius = 5
            $0.backgroundColor = .white
            
            $0.contentHorizontalAlignment = .left
            $0.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 8)
        }
    }
}
