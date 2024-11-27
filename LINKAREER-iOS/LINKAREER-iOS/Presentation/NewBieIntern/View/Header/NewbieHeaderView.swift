//
//  NewbieHeaderView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit
import SwiftUI

import Then
import SnapKit

class NewbieHeaderView: UICollectionReusableView {
    
    private let homeButton: UIButton = UIButton()
    private let internButton: UIButton = UIButton()
    private let entryButton: UIButton = UIButton()
    private let calendarButton: UIButton = UIButton()
    
    private let upHorizontalSeparator: SeparatorView = SeparatorView(axis: .horizontal)
    private let downHorizontalSeparator: SeparatorView = SeparatorView(axis: .horizontal)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        [homeButton, internButton, entryButton, calendarButton].forEach {
            $0.titleLabel?.font = fontStyle.body6_m_15.font()
            $0.setTitleColor(.gray600, for: .normal)
            $0.setTitleColor(.systemBlue, for: .selected)
            $0.backgroundColor = .clear
        }
        
        homeButton.setTitle("홈", for: .normal)
        internButton.setTitle("인턴", for: .normal)
        entryButton.setTitle("신입", for: .normal)
        calendarButton.setTitle("공고달력", for: .normal)
    }
    
    private func setHierarchy() {
        addSubviews(
            upHorizontalSeparator,
            downHorizontalSeparator,
            homeButton,
            internButton,
            entryButton,
            calendarButton
        )
    }
    
    private func setLayout() {
        upHorizontalSeparator.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        downHorizontalSeparator.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        homeButton.snp.makeConstraints {
            $0.top.equalTo(upHorizontalSeparator.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(28)
            $0.bottom.equalTo(downHorizontalSeparator.snp.top).offset(-8)
        }
        
        internButton.snp.makeConstraints {
            $0.top.equalTo(upHorizontalSeparator.snp.bottom).offset(8)
            $0.leading.equalTo(homeButton.snp.trailing).offset(28)
            $0.bottom.equalTo(downHorizontalSeparator.snp.top).offset(-8)
        }
        
        entryButton.snp.makeConstraints {
            $0.top.equalTo(upHorizontalSeparator.snp.bottom).offset(8)
            $0.leading.equalTo(internButton.snp.trailing).offset(28)
            $0.bottom.equalTo(downHorizontalSeparator.snp.top).offset(-8)
        }
        
        calendarButton.snp.makeConstraints {
            $0.top.equalTo(upHorizontalSeparator.snp.bottom).offset(8)
            $0.leading.equalTo(entryButton.snp.trailing).offset(28)
            $0.bottom.equalTo(downHorizontalSeparator.snp.top).offset(-8)
        }
    }
    
    private func setActions() {
        homeButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        internButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        entryButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        calendarButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        [homeButton, internButton, entryButton, calendarButton].forEach {
            $0.isSelected = false // 다른 버튼은 선택 해제
        }
        sender.isSelected = true // 클릭한 버튼만 선택
    }
}

struct NewbieHeaderViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let headerView = NewbieHeaderView()
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        return headerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct NewbieHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NewbieHeaderViewPreview()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
