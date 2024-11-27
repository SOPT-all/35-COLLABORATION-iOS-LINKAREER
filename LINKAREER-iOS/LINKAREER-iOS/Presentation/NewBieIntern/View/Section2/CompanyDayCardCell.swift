//
//  CompanyDayCardCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/19/24.
//
import UIKit
import SwiftUI

import SnapKit
import Then

class CompanyDayCardCell: UICollectionViewCell {
    
    private let boxView: UIView = UIView()
    private let dayLabel: PaddedUILabel = PaddedUILabel()
    private let categoryLabel: PaddedUILabel = PaddedUILabel()
    private let logoImageView: UIImageView = UIImageView()
    private let actionButton: UIButton = UIButton()
    private let companyNameLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let viewCountLabel: UILabel = UILabel()
    private let commentCountLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        
        backgroundColor = .white
        
        boxView.do {
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        
        dayLabel.setLabel(
            text: nil,
            alignment: .center,
            numberOfLines: 1,
            textColor: .white,
            font: fontStyle.label7_m_9.font()
        )
        
        dayLabel.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 4
            $0.layer.masksToBounds = true
            $0.padding = UIEdgeInsets(
                top: 2,
                left: 4,
                bottom: 2,
                right: 4)
        }
        
        companyNameLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.body9_m_12.font()
        )
        
        titleLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray900,
            font: fontStyle.body3_b_13.font()
        )
        
        categoryLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .systemBlue,
            font: fontStyle.label7_m_9.font()
        )
        
        categoryLabel.do {
            $0.backgroundColor = .blue100
            $0.layer.cornerRadius = 4
            $0.layer.masksToBounds = true
            $0.padding = UIEdgeInsets(
                top: 2,
                left: 4,
                bottom: 2,
                right: 4)
        }
        
        viewCountLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.label7_m_9.font()
        )
        
        commentCountLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.label7_m_9.font()
        )
        
        logoImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        
        actionButton.do {
            $0.setImage(
                UIImage(resource:.icBookmarkWDefault).withRenderingMode(.alwaysTemplate),
                for: .normal
            )
            $0.tintColor = .black
            $0.backgroundColor = .clear
        }
    }
    
    private func setHierarchy() {
        addSubviews(boxView, dayLabel, logoImageView, actionButton, companyNameLabel, titleLabel, categoryLabel, viewCountLabel, commentCountLabel)
        logoImageView.addSubview(dayLabel)
    }
    
    private func setLayout() {
        boxView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(logoImageView.snp.leading).offset(10)
            $0.top.equalTo(logoImageView.snp.top).offset(10)
            $0.width.height.lessThanOrEqualTo(40)
        }
        
        logoImageView.snp.makeConstraints {
            $0.center.equalTo(boxView)
        }
        
        actionButton.snp.makeConstraints {
            $0.top.equalTo(boxView.snp.top)
            $0.trailing.equalTo(boxView.snp.trailing)
            $0.height.width.equalTo(36)
        }
        
        companyNameLabel.snp.makeConstraints {
            $0.top.equalTo(boxView.snp.bottom).offset(8)
            $0.horizontalEdges.equalTo(boxView)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(companyNameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(boxView)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(boxView.snp.leading)
        }
        
        viewCountLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(8)
            $0.leading.equalTo(boxView.snp.leading)
        }
        
        commentCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(viewCountLabel)
            $0.leading.equalTo(viewCountLabel.snp.trailing).offset(3)
        }

    }
}
extension CompanyDayCardCell {
    
    func configure(with model: CompanyDayCardModel) {
        dayLabel.text = model.dDay
        logoImageView.kfSetImage(with: model.imageUrl, placeholder: UIImage(named: "placeholder"))
        actionButton.isSelected = model.bookmark
        companyNameLabel.text = model.companyName
        titleLabel.text = model.title
        categoryLabel.text = model.tag
        viewCountLabel.text = "조회수 \(model.views)"
        commentCountLabel.text = "댓글 \(model.comments)"
    }
    
    private func updateBookmarkButtonUI() {
         let image = actionButton.isSelected
        ? UIImage(systemName: "bookmark.fill") // 이거 채워진 북마크가 없어서 일단 기본 제공 북마크로 대체
        : UIImage(resource: .icBookmarkWDefault)
         actionButton.setImage(image, for: .normal)
     }
}
