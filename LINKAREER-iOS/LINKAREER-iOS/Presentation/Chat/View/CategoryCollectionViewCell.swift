//
//  CategoryCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/22/24.
//

import UIKit

import Then
import SnapKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            self.backgroundColor = isSelected ? .lkBlue: .gray300
            chipLabel.textColor = isSelected ? .white : .gray900
        }
    }
    
    let chipLabel: UILabel = UILabel()
    
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


extension CategoryCollectionViewCell {
    func setHierarchy() {
        addSubview(chipLabel)
    }
    
    func setLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(36)
        }
        
        chipLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
        }
    }
    
    func setStyle() {
        self.do {
            $0.layer.cornerRadius = 18
            $0.backgroundColor = .gray300
        }
        
        chipLabel.do {
            $0.font = fontStyle.body7_m_14.font()
            $0.textColor = .gray900
            $0.textAlignment = .center
        }
    }
}

extension CategoryCollectionViewCell {
    func configure(data: ChatCategoryList) {
        chipLabel.text = data.category
    }
}
