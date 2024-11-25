//
//  CompanyBigCardCell 2.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/22/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class CompanyBigCardCell: UICollectionViewCell {
    
    private let boxView: UIView = UIView()
    private let companyImageView: UIImageView = UIImageView()
    private let companyNameLabel: UILabel = UILabel()
    private let guideButton: UIButton = UIButton()
    private let horizontalSeparator = SeparatorView(axis: .horizontal)
    
    private let separatorLeft: SeparatorView = SeparatorView(axis: .vertical)
    private let separatorCenter: SeparatorView = SeparatorView(axis: .vertical)
    private let separatorRight: SeparatorView = SeparatorView(axis: .vertical)
    
    private let profileCraftBox: CustomBoxView = CustomBoxView(title: "자소서")
    private let aptitudeCheckBox: CustomBoxView = CustomBoxView(title: "인적성")
    private let interviewPassBox: CustomBoxView = CustomBoxView(title: "면접")
    private let finalSealBox: CustomBoxView = CustomBoxView(title: "최종합격")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
                
        boxView.do {
            $0.backgroundColor = .gray100
            $0.layer.cornerRadius = 8
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.layer.borderWidth = 1
        }
        
        companyImageView.do {
            $0.contentMode = .scaleAspectFit
            $0.layer.cornerRadius = 8
            $0.clipsToBounds = true
        }
        
        companyNameLabel.do {
            $0.font = .boldSystemFont(ofSize: 16)
            $0.textColor = .black
        }
        
        guideButton.do {
            var config = UIButton.Configuration.plain()
            config.title = "합격 가이드 더보기"
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.systemFont(ofSize: 12)
                outgoing.foregroundColor = UIColor.gray600
                return outgoing
            }
            config.image = UIImage(resource: .icArrowRightB12)
            config.imagePlacement = .trailing
            $0.configuration = config
        }
    }
    
    private func setHierarchy() {
        addSubview(boxView)
        boxView.addSubviews(
            companyImageView,
            companyNameLabel,
            guideButton,
            horizontalSeparator,
            aptitudeCheckBox,
            profileCraftBox,
            finalSealBox,
            interviewPassBox,
            separatorLeft,
            separatorRight,
            separatorCenter
        )
        
    }
    
    private func setLayout() {
        
        boxView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        companyImageView.snp.makeConstraints {
            $0.leading.top.equalToSuperview().inset(12)
            $0.size.equalTo(54)
        }
        
        companyNameLabel.snp.makeConstraints {
            $0.centerY.equalTo(companyImageView)
            $0.left.equalTo(companyImageView.snp.right).offset(8)
        }
        
        guideButton.snp.makeConstraints {
            $0.centerY.equalTo(companyImageView)
            $0.trailing.equalToSuperview().inset(16)
            
        }
        
        horizontalSeparator.snp.makeConstraints {
            $0.top.equalTo(companyImageView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.height.equalTo(1)
        }
        
        separatorCenter.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(boxView.snp.bottom).offset(-19)
        }
        
        aptitudeCheckBox.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(14)
            $0.trailing.equalTo(separatorCenter.snp.trailing).offset(-1)
            $0.width.equalTo(85)
            $0.height.equalTo(54)
        }
    
        separatorLeft.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(15)
            $0.trailing.equalTo(aptitudeCheckBox.snp.leading).offset(-1)
            $0.bottom.equalTo(boxView.snp.bottom).offset(-19)
        }
        
        profileCraftBox.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(14)
            $0.trailing.equalTo(separatorLeft.snp.leading).offset(-1)
            $0.width.equalTo(85)
            $0.height.equalTo(54)
        }
        
        interviewPassBox.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(15)
            $0.leading.equalTo(separatorCenter.snp.trailing).offset(1)
            $0.bottom.equalTo(boxView.snp.bottom).offset(-19)
            $0.width.equalTo(85)
            $0.height.equalTo(54)
        }
        
        separatorRight.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(15)
            $0.leading.equalTo(interviewPassBox.snp.trailing).offset(1)
            $0.bottom.equalTo(boxView.snp.bottom).offset(-19)
        }
        
        finalSealBox.snp.makeConstraints{
            $0.top.equalTo(horizontalSeparator.snp.bottom).offset(15)
            $0.leading.equalTo(separatorRight.snp.trailing).offset(1)
            $0.bottom.equalTo(boxView.snp.bottom).offset(-19)
            $0.width.equalTo(85)
            $0.height.equalTo(54)
        }
    }
}

extension CompanyBigCardCell{
    func configure(
        with model: CompanyBigCardDataModel
    ) {
        companyImageView.image = model.companyImage
        companyNameLabel.text = model.companyName
        profileCraftBox.configure(model.profileCraftPoint)
        aptitudeCheckBox.configure(model.aptitudeCheckPoint)
        interviewPassBox.configure(model.interviewPassPoint)
        finalSealBox.configure(model.finalSealPoint)
    }
}
