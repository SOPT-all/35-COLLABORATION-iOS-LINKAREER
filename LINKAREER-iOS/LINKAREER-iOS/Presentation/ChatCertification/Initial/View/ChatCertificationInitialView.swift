//
//  ChatCertificationInitialView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/19/24.
//

import UIKit

import SnapKit
import Then

final class ChatCertificationInitialView: UIView {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 80)
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    private let confirmButton = UIButton()
    
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

extension ChatCertificationInitialView {
    func setHierarchy() {
        addSubviews(titleLabel, listCollectionView, confirmButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().inset(14)
        }
        
        listCollectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(confirmButton.snp.top).offset(-16)
        }
        
        confirmButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(24)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
    
    func setStyle() {
        backgroundColor = .white
        
        titleLabel.do {
            $0.text = "대화의 신뢰도를 높이기 위해 \n세 가지 정보를 여쭤보고 있어요"
            $0.font = fontStyle.title2_b_17.font()
            $0.textColor = .gray900
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }
        
        listCollectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }
        
        confirmButton.do {
            $0.setTitle("확인", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = fontStyle.body3_b_13.font()
            $0.backgroundColor = .lkBlue
            $0.layer.cornerRadius = 8
        }
    }
}
