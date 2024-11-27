//
//  HomeBannerCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/19/24.
//

import UIKit

import SnapKit
import Then

protocol MainPosterDelegate: AnyObject {
    func didSwipePoster(index: Int, vc: UIPageViewController, vcData: [UIViewController])
}

final class HomeBannerCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let bannerImage: UIImageView = UIImageView()
    
    private let dDayButton: UIButton = UIButton()
    private let bookMarkButton: UIButton = UIButton()
    
    private let companyLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    
    private let benefitTagButton: UIButton = UIButton()
    
    private let viewsLabel: UILabel = UILabel()
    private let commentLabel: UILabel = UILabel()
   
    
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
        self.addSubviews(bannerImage, dDayButton, bookMarkButton, companyLabel, titleLabel, benefitTagButton, viewsLabel, commentLabel)
    }
    
    func setLayout() {
        bannerImage.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(177)
        }
        
        dDayButton.snp.makeConstraints {
            $0.top.equalTo(bannerImage).inset(9.5)
            $0.leading.equalTo(bannerImage).inset(10)
            $0.height.equalTo(17)
        }
        
        bookMarkButton.snp.makeConstraints {
            $0.top.equalTo(bannerImage)
            $0.trailing.equalTo(bannerImage).inset(10)
        }
        
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(bannerImage.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(companyLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalToSuperview()
        }
        
        benefitTagButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        viewsLabel.snp.makeConstraints {
            $0.top.equalTo(benefitTagButton.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        commentLabel.snp.makeConstraints {
            $0.centerY.equalTo(viewsLabel)
            $0.leading.equalTo(viewsLabel.snp.trailing).offset(8)
        }
    }
    
    func setStyle() {
        dDayButton.do {
            $0.setTitle("D - 00", for: .normal)
            $0.titleLabel?.font = fontStyle.label7_m_9.font()
            $0.setTitleColor(.lkWhite, for: .normal)
            $0.backgroundColor = .gray900
            $0.layer.cornerRadius = 4
            $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        
        bookMarkButton.do {
            $0.setImage(.icScrapBDefault, for: .normal)
        }
        
        companyLabel.do {
            $0.font = fontStyle.body9_m_12.font()
            $0.textColor = .gray600
        }
        
        titleLabel.do {
            $0.setLabel(alignment: .left, numberOfLines: 1, textColor: .gray900, font: fontStyle.body2_b_14.font())
        }
        
        benefitTagButton.do {
            $0.titleLabel?.font = fontStyle.label7_m_9.font()
            $0.setTitleColor(.lkBlue, for: .normal)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 4
            $0.backgroundColor = .blue100
            $0.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        }
        
        viewsLabel.do {
            $0.setLabel(textColor: .gray600, font: fontStyle.label7_m_9.font())
        }
        
        commentLabel.do {
            $0.setLabel(textColor: .gray600, font: fontStyle.label7_m_9.font())
        }
    }
}


extension HomeBannerCell {
    
    func configure(with banner: HomeBanner) {
        dDayButton.setTitle("D - \(banner.dDay)", for: .normal)
        bannerImage.image = banner.image
        companyLabel.text = banner.company
        titleLabel.text = banner.title
        benefitTagButton.setTitle( banner.benefit, for: .normal)
        viewsLabel.text = "조회수 \(banner.views)"
        commentLabel.text = "댓글 \(banner.comment)"
    }
    
}


