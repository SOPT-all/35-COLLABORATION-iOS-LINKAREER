//
//  BoardCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/20/24.
//

import UIKit

import SnapKit
import Then


final class BoardCell: UICollectionViewCell {
    
    // MARK: - UI Properties

    private let benefitTagButton: UIButton = UIButton()
    private let titleLabel: UILabel = UILabel()
    private let contentLabel: UILabel = UILabel()
    
    private let writerLabel: UILabel = UILabel()
    private let createAtLabel: UILabel = UILabel()
    
    private let likeIcon: UIImageView = UIImageView(image: .icThumbsupCommuG12)
    private let likeLabel: UILabel = UILabel()
    
    private let commentIcon: UIImageView = UIImageView(image: .icComentCommuG12)
    private let commentLabel: UILabel = UILabel()
    
    private let viewsIcon: UIImageView = UIImageView(image: .icViewCommuG12)
    private let viewsLabel: UILabel = UILabel()
    
    private let imageView: UIImageView = UIImageView()
    
    private let lineView: UIView = UIView()
    
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
        self.addSubviews(benefitTagButton, titleLabel, contentLabel, writerLabel, createAtLabel, likeIcon, likeLabel, commentIcon, commentLabel, viewsIcon, viewsLabel, imageView, lineView)
    }
    
    func setLayout() {
        benefitTagButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(10)
            $0.height.equalTo(21)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(benefitTagButton.snp.bottom).offset(8)
            $0.leading.equalTo(benefitTagButton)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(10)
            $0.size.equalTo(70)
        }
        
        writerLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
        
        likeIcon.snp.makeConstraints {
            $0.top.equalTo(writerLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
            $0.size.equalTo(12)
        }
        
        likeLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeIcon)
            $0.leading.equalTo(likeIcon.snp.trailing).offset(2)
        }
        
        commentIcon.snp.makeConstraints {
            $0.centerY.equalTo(likeIcon)
            $0.leading.equalTo(likeLabel.snp.trailing).offset(6)
            $0.size.equalTo(12)
        }
        
        commentLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeIcon)
            $0.leading.equalTo(commentIcon.snp.trailing).offset(0.5)
        }
        
        viewsIcon.snp.makeConstraints {
            $0.centerY.equalTo(likeIcon)
            $0.leading.equalTo(commentLabel.snp.trailing).offset(6)
            $0.size.equalTo(12)
        }
        
        viewsLabel.snp.makeConstraints {
            $0.centerY.equalTo(likeIcon)
            $0.leading.equalTo(viewsIcon.snp.trailing).offset(2)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func setStyle() {
        benefitTagButton.do {
            $0.titleLabel?.font = fontStyle.label7_m_9.font()
            $0.setTitleColor(.gray600, for: .normal)
            $0.layer.cornerRadius = 4
            $0.backgroundColor = .gray300
            $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        
        titleLabel.do {
            $0.font = fontStyle.title3_b_16.font()
            $0.textColor = .gray900
        }
        
        contentLabel.do {
            $0.font = fontStyle.body11_r_13.font()
            $0.textColor = .gray800
        }
        
        imageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 4
        }
        
        writerLabel.do {
            $0.text = "문과출신"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        createAtLabel.do {
            $0.text = "2시간 전"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        likeLabel.do {
            $0.text = "245"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        commentLabel.do {
            $0.text = "64"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        viewsLabel.do {
            $0.text = "6546"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        lineView.backgroundColor = .gray300
    }

}

extension BoardCell {
    
    func configure(with board: Board) {
        benefitTagButton.setTitle( board.category, for: .normal)
        titleLabel.text = board.title
        contentLabel.text = board.content
        imageView.image = board.image
    }
    
}

