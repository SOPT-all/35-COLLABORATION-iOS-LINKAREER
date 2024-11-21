//
//  CompanySmallCardCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit
import SwiftUI

import Then
import SnapKit

class CompanySmallCardView: UIView {
    
    private let headLabel: UILabel = UILabel()
    private let boldLabel: UILabel = UILabel()
    private let boxView: UIView = UIView()
    private let iconView: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle(){
        
        boxView.do{
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 10
            $0.layer.masksToBounds = true
        }
        
        headLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.label7_m_9.font()
        )
        
        boldLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 2,
            textColor: .gray900,
            font: fontStyle.body4_b_12.font()
        )
        boldLabel.lineBreakMode = .byWordWrapping
        
    }
    
    func setHierarchy() {
        addSubview(boxView)
        [headLabel, boldLabel, iconView].forEach { boxView.addSubview($0) }
    }
    
    func setLayout(){
        
        boxView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
            $0.height.equalTo(134)
        }
        
        headLabel.snp.makeConstraints{
            $0.top.equalTo(boxView.snp.top).offset(16)
            $0.leading.equalTo(boxView.snp.leading).offset(12)
        }
        
        boldLabel.snp.makeConstraints{
            $0.top.equalTo(headLabel.snp.bottom).offset(2)
            $0.leading.equalTo(headLabel.snp.leading)
            $0.trailing.equalTo(boxView.snp.trailing).offset(-30)
            
        }
        
        iconView.snp.makeConstraints{
            $0.trailing.equalTo(boxView.snp.trailing).offset(-4)
            $0.bottom.equalTo(boxView.snp.bottom).offset(-12)
            $0.width.equalTo(48)
            $0.height.equalTo(48)
        }
        
    }
}
    
extension CompanySmallCardView {
        
    func configure(
        iconImage: UIImage,
        head: String,
        boldText: String
    ) {
        iconView.image = iconImage
        headLabel.text = head
        boldLabel.text = boldText
    }
    
}

//pre뷰

struct CompanySmallCardViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> CompanySmallCardView {
        let card = CompanySmallCardView()
        card.configure(
            iconImage: UIImage(systemName: "star.fill")!,
            head: "합격을 위하여",
            boldText: "인적성 합격 후기"
        )
        return card
    }

    func updateUIView(_ uiView: CompanySmallCardView, context: Context) {
        // 업데이트 로직 필요 시 추가
    }
}

struct CompanySmallCardCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        CompanySmallCardViewPreview()
    }
}
