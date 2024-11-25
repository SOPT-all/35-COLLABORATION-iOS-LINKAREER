//
//  ㅐㅐㅐ.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit

import SnapKit
import Then
import SwiftUI

final class FooterView: UICollectionReusableView {
    
    private let termsButton: UIButton = UIButton()
    private let privacyButton: UIButton = UIButton()
    private let supportButton: UIButton = UIButton()
    private let copyrightLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setStyle()
        setActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setHierarchy() {
        addSubviews(termsButton, privacyButton, supportButton, copyrightLabel)
    }
    
    private func setLayout() {
     
        privacyButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        termsButton.snp.makeConstraints {
            $0.top.equalTo(privacyButton)
            $0.centerX.equalToSuperview().multipliedBy(0.33)
        }
        
        supportButton.snp.makeConstraints {
            $0.top.equalTo(privacyButton)
            $0.centerX.equalToSuperview().multipliedBy(1.66)
        }
        
        copyrightLabel.snp.makeConstraints {
            $0.top.equalTo(privacyButton.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        
        self.backgroundColor = .gray100

        [termsButton, privacyButton, supportButton].forEach { button in
            button.do {
                $0.titleLabel?.font = fontStyle.label6_m_10.font()
                $0.setTitleColor(.black, for: .normal)
                
            }
        }
        
        termsButton.setTitle("이용약관", for: .normal)
        privacyButton.setTitle("개인정보처리방침", for: .normal)
        supportButton.setTitle("고객문의", for: .normal)
        
        copyrightLabel.do {
            $0.text = "Copyright © Linkareer Inc. All Rights Reserved."
            $0.textColor = .gray400
            $0.font = fontStyle.label2_b_11.font()
            $0.textAlignment = .center
        }
    }
    
    private func setActions() {
        termsButton.addTarget(self, action: #selector(termsButtonTapped), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
        supportButton.addTarget(self, action: #selector(supportButtonTapped), for: .touchUpInside)
    }
    
    @objc private func termsButtonTapped() {
        print("무야호1")
    }
    
    @objc private func privacyButtonTapped() {
        print("무야호2")
    }
    
    @objc private func supportButtonTapped() {
        print("무야호3")
    }
    
}


struct FooterViewPreview: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UIView {
        let footerView = FooterView()
        footerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80)
        return footerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct FooterViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        FooterViewPreview()
            .frame(height: 80)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
