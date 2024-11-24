//
//  CustomBoxVIew.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/22/24.
//

import UIKit

import Then
// for CompanyBigCardCell
class CustomBoxView: UIView {
    
    private let titleLabel = UILabel()
    private let pointLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        setLayout()
        setStyle()
        titleLabel.text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.font = .systemFont(ofSize: 11)
            $0.textColor = .gray700
            $0.textAlignment = .center
        }
        
        pointLabel.do {
            $0.font = .boldSystemFont(ofSize: 14)
            $0.textColor = .black
            $0.textAlignment = .center
        }
    }
    
    private func setLayout() {
        
        addSubviews(titleLabel, pointLabel)
        
        pointLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(pointLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
    }
}

extension CustomBoxView{
    func configure(_ point: String) {
        pointLabel.text = point
    }
}
