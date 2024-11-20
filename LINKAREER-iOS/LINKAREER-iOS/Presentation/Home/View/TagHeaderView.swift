//
//  TagHeaderView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/19/24.
//

import UIKit

import SnapKit
import Then

class TagHeaderView: UICollectionReusableView {
    
    // MARK: - UI Properties
    
    private let titleLabel: UILabel = UILabel()
    
    private let tagStackView: UIStackView = UIStackView()
    private let descriptionLabel: UILabel = UILabel()
    
    private let moreButton: UIButton = UIButton()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHierarchy() {
        self.addSubviews(titleLabel, tagStackView, descriptionLabel, moreButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        tagStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(tagStackView)
            $0.leading.equalTo(tagStackView.snp.trailing).offset(4)
        }
        
        moreButton.snp.makeConstraints {
            $0.verticalEdges.trailing.equalToSuperview()
            $0.width.equalTo(43)
        }
    }
    
    func setStyle() {
        backgroundColor = .yellow
        titleLabel.do {
            $0.font = fontStyle.title1_b_18.font()
            $0.textColor = .lkBlack
        }
        
        tagStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        descriptionLabel.do {
            $0.font = fontStyle.label7_m_9.font()
            $0.textColor = .gray600
        }
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.titleLabel?.font = fontStyle.label5_m_11.font()
            $0.setTitleColor(.gray800, for: .normal)
            $0.setImage(.icArrowRightB12, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
            $0.semanticContentAttribute = .forceRightToLeft
            $0.contentHorizontalAlignment = .right
        }
    }
    
}
