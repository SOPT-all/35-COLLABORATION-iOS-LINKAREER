//
//  SectionBackgroundView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import UIKit

class SectionBackgroundView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue50
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

