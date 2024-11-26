//
//  SegmentStackView.swift
//  LINKAREER-iOS
//
//  Created by 김민서 on 11/26/24.
//

import UIKit

import SnapKit
import Then

class SegmentStackView: UIView {
    
    // MARK: - UI Properties
    
    private let scrollView: UIScrollView = UIScrollView()
    private let stackView: UIStackView = UIStackView()
    
    private let arrowDownButton: UIButton = UIButton()
    
    private let lineView: UIView = UIView()
    
    // MARK: - Properties
    
    private var tagButtons: [UIButton] = []
    
    let tagTexts: [String] = [
        "신입/인턴", "대외활동/교육/공모전", "채널", "커뮤니티", "멘토 게시판", "자기소개서", "스펙 정리하기"
    ]
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
        setCategoryList()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setHierarchy() {
        self.addSubviews(lineView, scrollView, arrowDownButton, lineView)
        scrollView.addSubview(stackView)
    }
    
    func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        stackView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(scrollView).offset(16)
            $0.trailing.equalTo(scrollView).offset(-16)
        }
        
        arrowDownButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(14)
            $0.size.equalTo(30)
        }
        
        lineView.snp.makeConstraints {
            $0.bottom.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
    }
    
    func setStyle() {
        scrollView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.showsHorizontalScrollIndicator = false
            $0.alwaysBounceHorizontal = true
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.alignment = .fill
            $0.distribution = .fill
        }
        
        arrowDownButton.do {
            $0.setImage(.icArrowDown24, for: .normal)
            $0.backgroundColor = .lkWhite
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.layer.cornerRadius = 2
        }
        
        lineView.backgroundColor = .gray300
    }
    
}

extension SegmentStackView {
    
    private func setCategoryList() {
        for tagText in tagTexts {
            let tagButton: UIButton = UIButton()
            
            tagButton.do {
                $0.setTitle(tagText, for: .normal)
                $0.setTitleColor(.gray900, for: .normal)
                $0.titleLabel?.font = fontStyle.title3_b_16.font()
                $0.tag = tagButtons.count // 버튼의 index를 tag로 설정
            }
            
            tagButton.snp.makeConstraints {
                $0.height.equalTo(48)
            }
            
            tagButtons.append(tagButton)
            stackView.addArrangedSubview(tagButton)
        }
    }
}


