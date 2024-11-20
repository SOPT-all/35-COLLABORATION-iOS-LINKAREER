//
//  BottomPageControlView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/20/24.
//

import UIKit

import SnapKit
import Then

class BottomPageControlView: UICollectionReusableView {
    
    // MARK: - UI Properties
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue100
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

