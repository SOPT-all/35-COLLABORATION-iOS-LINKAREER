//
//  CaptureButton.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/21/24.
//

import UIKit

import Then
import SnapKit

final class CaptureButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CaptureButton {
    func setupStyle() {
        self.do {
            $0.backgroundColor = .gray200
            $0.layer.cornerRadius = 10
            $0.layer.borderColor = UIColor.gray400.cgColor
            $0.layer.borderWidth = 1
            
            $0.setTitle("합격 화면 캡쳐본 등록하기", for: .normal)
            $0.setTitleColor(.gray600, for: .normal)
            $0.titleLabel?.font = fontStyle.body13_r_11.font()
            
            
            let plusIcon = UIImage(resource: .icRegist)
            $0.setImage(plusIcon, for: .normal)
            
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -12, right: 0)
        }
    }
 
    func setupLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(160)
        }
        
        self.contentHorizontalAlignment = .center
        self.contentVerticalAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
        self.titleLabel?.textAlignment = .center
        
        let spacing: CGFloat = 10
        guard let imageView = self.imageView, let titleLabel = self.titleLabel else { return }
        
        self.titleEdgeInsets = UIEdgeInsets(
            top: spacing + imageView.frame.height,
            left: -imageView.frame.width - 40,
            bottom: spacing + titleLabel.frame.height + 50,
            right: 0
        )
        
        self.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: -imageView.frame.width + 130,
            bottom: -30,
            right: 0
        )
    }
}
