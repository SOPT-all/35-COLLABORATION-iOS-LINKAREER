//
//  CompanyHorizontalScrollview.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class CompanyHorizontalScrollViewCell: UICollectionViewCell {
    
    private let scrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceHorizontal = true
    }
    private let containerView = UIView()
    private var previousCard: UIView? = nil
    private let cardWidth: CGFloat = 142
    private let cardSpacing: CGFloat = 8

    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setHierarchy() {
        contentView.addSubview(scrollView)
        scrollView.addSubview(containerView)
    }

    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }

    func configure(with data: [CompanyDayCardDataModel]) {
        previousCard = nil
        for item in data {
            let card = CompanyDayCardCell()
            card.configure(
                day: item.day,
                image: item.image,
                buttonTitle: item.buttonTitle,
                companyName: item.companyName,
                title: item.title,
                category: item.category,
                viewCount: item.viewCount,
                commentCount: item.commentCount
            )
            containerView.addSubview(card)
            card.snp.makeConstraints {
                $0.width.equalTo(cardWidth)
                $0.height.equalToSuperview()
                $0.top.equalToSuperview()
                if let previous = previousCard {
                    $0.leading.equalTo(previous.snp.trailing).offset(cardSpacing)
                } else {
                    $0.leading.equalToSuperview().offset(cardSpacing)
                }
            }
            previousCard = card
        }
        if let lastCard = previousCard {
            lastCard.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-cardSpacing)
            }
        }
    }

}

