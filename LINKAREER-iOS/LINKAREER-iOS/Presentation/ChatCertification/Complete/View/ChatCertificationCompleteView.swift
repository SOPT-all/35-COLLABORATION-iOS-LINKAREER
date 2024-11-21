//
//  ChatCertificationCompleteView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/21/24.
//

import UIKit

import SnapKit
import Then

final class ChatCertificationCompleteView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel: UILabel = UILabel()
    private let subTitleLabel: UILabel = UILabel()
    private let completeImage: UIImageView = UIImageView()
    private lazy var completeButton: UIButton = UIButton()

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

extension ChatCertificationCompleteView {

    func setHierarchy() {
        addSubviews(titleLabel, subTitleLabel, completeImage, completeButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().inset(14)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(14)
        }
        
        completeImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(189)
            $0.size.equalTo(144)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(24)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    func setStyle() {
        titleLabel.do {
            $0.text = "인증에 필요한 정보들이 \n모두 입력되었어요"
            $0.font = fontStyle.title2_b_17.font()
            $0.textColor = .gray900
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        
        subTitleLabel.do {
            $0.text = "합격 인증 완료까지 최소 3일이 소요되는 점 참고해주세요"
            $0.font = fontStyle.body9_m_12.font()
            $0.textColor = .gray700
            $0.textAlignment = .left
        }
        
        completeImage.do {
            $0.image = .icCheckCircle144
        }
        
        completeButton.do {
            $0.setTitle("완료", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .lkBlue
            $0.titleLabel?.font = fontStyle.body3_b_13.font()
            $0.layer.cornerRadius = 8
        }
    }
}
