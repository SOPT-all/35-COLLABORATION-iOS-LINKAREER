//
//  NoTagHeaderView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/24/24.
//

import UIKit

import SnapKit
import Then

class NoTagHeaderView: UICollectionReusableView {
    
    private let nickNameLabel: UILabel = UILabel()
    private let titleLabel: UILabel = UILabel()
    private let moreButton: UIButton = UIButton()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        self.addSubviews(nickNameLabel, titleLabel, moreButton)
    }
    
    private func setLayout() {
        nickNameLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(nickNameLabel)
            $0.leading.equalTo(nickNameLabel.snp.trailing).offset(5)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(nickNameLabel)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(43)
        }
    }
    
    private func setStyle() {
        nickNameLabel.do {
            $0.setLabel(textColor: .lkBlue, font: fontStyle.title1_b_18.font())
        }
        
        titleLabel.do {
            $0.setLabel(textColor: .lkBlack, font: fontStyle.title1_b_18.font())
        }
        
        moreButton.do {
            $0.setTitle("더보기", for: .normal)
            $0.titleLabel?.font = fontStyle.label5_m_11.font()
            $0.setTitleColor(.gray800, for: .normal)
            $0.setImage(.icArrowRightB12, for: .normal)
            $0.imageView?.contentMode = .scaleAspectFit
            $0.semanticContentAttribute = .forceRightToLeft
            $0.contentHorizontalAlignment = .right
        }
    }
}

extension NoTagHeaderView {
    
    func configure(noTagHeaderData: NoTagHeader) {
        nickNameLabel.text = noTagHeaderData.nickname
        titleLabel.text = noTagHeaderData.title
    }
}

import SwiftUI

struct NoTagHeaderViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> NoTagHeaderView {
        let view = NoTagHeaderView()
        
        // 샘플 데이터 설정
        let sampleData = NoTagHeader(nickname: "앤솝", title: "님이 관심 있을만한 공고")
        view.configure(noTagHeaderData: sampleData)
        
        return view
    }
    
    func updateUIView(_ uiView: NoTagHeaderView, context: Context) {
        // 업데이트 시 필요하다면 추가 작업 수행
    }
}

struct NoTagHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        NoTagHeaderViewPreview()
            .frame(width: 400, height: 80) // 원하는 크기로 조정
            .previewLayout(.sizeThatFits)
    }
}
