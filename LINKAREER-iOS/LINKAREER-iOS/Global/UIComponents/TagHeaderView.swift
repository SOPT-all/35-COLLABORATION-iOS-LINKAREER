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
    private let nickNameLabel: UILabel = UILabel()
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
        self.addSubviews(nickNameLabel, titleLabel, tagStackView, descriptionLabel, moreButton)
    }
    
    func setLayout() {
        nickNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(nickNameLabel)
            $0.leading.equalTo(nickNameLabel.snp.trailing).offset(5)
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
            $0.bottom.equalTo(tagStackView).inset(15)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(43)
        }
    }
    
    func setStyle() {
        nickNameLabel.do {
            $0.setLabel(textColor: .lkBlue, font: fontStyle.title1_b_18.font())
        }
        
        titleLabel.do {
            $0.setLabel(textColor: .lkBlack, font: fontStyle.title1_b_18.font())
        }
        
        tagStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        descriptionLabel.do {
            $0.setLabel(textColor: .gray600, font: fontStyle.label7_m_9.font())
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

extension TagHeaderView {
    
    func configure(headerData: TagHeader) {
        nickNameLabel.text = headerData.nickname
        titleLabel.text = headerData.title
        descriptionLabel.text = headerData.discription
        
        tagStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        headerData.tags.forEach { tag in
            let tagButton: UIButton = UIButton()
    
            tagButton.do {
                $0.setTitle(tag, for: .normal)
                $0.titleLabel?.font = fontStyle.label7_m_9.font()
                $0.setTitleColor(.lkBlue, for: .normal)
                $0.backgroundColor = .white
                $0.clipsToBounds = true
                $0.layer.borderWidth = 0.5
                $0.layer.borderColor = UIColor.lkBlue.cgColor
                $0.layer.cornerRadius = 4
                $0.contentEdgeInsets = UIEdgeInsets(top: 2, left: 6, bottom: 2, right: 6)
            }
            
            tagStackView.addArrangedSubview(tagButton)
            
            tagButton.snp.makeConstraints {
                $0.height.equalTo(17)
                $0.width.greaterThanOrEqualTo(50)
            }
            
        }
    }
}
