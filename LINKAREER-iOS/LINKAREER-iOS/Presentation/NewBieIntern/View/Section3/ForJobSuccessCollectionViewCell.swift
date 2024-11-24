//
//  JobSuccessViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class ForJobSuccessCollectionViewCell: UICollectionViewCell {
    
    private let headerView : ForJobSuccessHeaderView = ForJobSuccessHeaderView()
    private let firstCard : CompanySmallCardView = CompanySmallCardView()
    private let secondCard : CompanySmallCardView = CompanySmallCardView()
    private let thirdCard : CompanySmallCardView = CompanySmallCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setHierarchy()
        setLayout()
    }
    
    private func setHierarchy() {
        contentView.addSubviews(headerView, firstCard, secondCard, thirdCard)
    }
    
    private func setLayout() {
        
        headerView.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        firstCard.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(33)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.317)
            $0.height.equalTo(134)
        }
        
        secondCard.snp.makeConstraints {
            $0.top.equalTo(firstCard)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.317)
            $0.height.equalTo(134)
        }
        
        thirdCard.snp.makeConstraints {
            $0.top.equalTo(firstCard)
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.317)
            $0.height.equalTo(134)
        }
    }
}

extension ForJobSuccessCollectionViewCell {
    
    func configure(with model: SectionTitleModel) {
        headerView.configure(title: model.title)
        
        if let firstItem = model.items1.first {
            firstCard.configure(
                iconImage: firstItem.iconImage,
                head: firstItem.head,
                boldText: firstItem.boldText
            )
        }
        
        if let secondItem = model.items2.first {
            secondCard.configure(
                iconImage: secondItem.iconImage,
                head: secondItem.head,
                boldText: secondItem.boldText
            )
        }
        
        if let thirdItem = model.items3.first {
            thirdCard.configure(
                iconImage: thirdItem.iconImage,
                head: thirdItem.head,
                boldText: thirdItem.boldText
            )
        }
    }
}

// MARK: - Preview

struct ForJobSuccessCollectionViewCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> ForJobSuccessCollectionViewCell {
        let cell = ForJobSuccessCollectionViewCell(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        let dummyData = SectionTitleModelData.shared.section1
        cell.configure(with: dummyData)
        return cell
    }

    func updateUIView(_ uiView: ForJobSuccessCollectionViewCell, context: Context) {}
}

struct ForJobSuccessCollectionViewCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        ForJobSuccessCollectionViewCellPreview()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height) // 화면 크기로 고정
            .ignoresSafeArea() // Safe Area 무시
    }
}
