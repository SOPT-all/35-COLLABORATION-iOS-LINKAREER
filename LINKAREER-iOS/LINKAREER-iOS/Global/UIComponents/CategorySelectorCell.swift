//
//  CategorySelectorCell.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/21/24.
//

import UIKit

import SnapKit
import Then


final class CategorySelectorCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let categoryLabel: UILabel = UILabel()
    
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
        self.addSubview(categoryLabel)
    }
    
    func setLayout() {
        categoryLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setStyle() {
        self.do {
            $0.backgroundColor = .gray300
            $0.layer.cornerRadius = 19
            $0.clipsToBounds = true
        }
        
        categoryLabel.do {
            $0.textColor = .gray900
            $0.font = fontStyle.body7_m_14.font()
            $0.textAlignment = .center
            $0.setContentCompressionResistancePriority(.required, for: .horizontal)
            $0.setContentHuggingPriority(.required, for: .horizontal)
        }
    }
}

extension CategorySelectorCell {
    
    func configure(with category: CategorySelector, isSelected: Bool) {
        categoryLabel.text = category.title
        updateSelectionState(isSelectedCell: isSelected)
    }
    
    func updateSelectionState(isSelectedCell: Bool) {
        if isSelectedCell {
            self.backgroundColor = .lkBlue
            categoryLabel.textColor = .lkWhite
        } else {
            self.backgroundColor = .gray300 
            categoryLabel.textColor = .gray900
        }
    }

}
