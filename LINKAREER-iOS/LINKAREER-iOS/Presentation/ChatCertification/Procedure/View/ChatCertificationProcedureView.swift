//
//  ChatCertificationProcedureView.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/21/24.
//

import UIKit

import Then
import SnapKit

final class ChatCertificationProcedureView: UIView {

    private let titleLabel = UILabel()
    
    private let nameLabel = UILabel()
    let nameTextField = UITextField()
    
    private let phoneLabel = UILabel()
    let phoneTextField = UITextField()
    
    private let passPhotoLabel = UILabel()
    private let passPhotoSubLabel = UILabel()
    private lazy var passPhotoButton = CaptureButton()
    
    lazy var completeButton = UIButton()
    
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

extension ChatCertificationProcedureView {

    func setHierarchy() {
        addSubviews(titleLabel, nameLabel, nameTextField, phoneLabel, phoneTextField, passPhotoLabel, passPhotoSubLabel, passPhotoButton, completeButton)
    }

    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(24)
            $0.leading.equalToSuperview().inset(14)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(14)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(40)
        }
        
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(14)
        }
        
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(40)
        }
        
        passPhotoLabel.snp.makeConstraints {
            $0.top.equalTo(phoneTextField.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(14)
        }
        
        passPhotoSubLabel.snp.makeConstraints {
            $0.top.equalTo(passPhotoLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(14)
        }
        
        passPhotoButton.snp.makeConstraints {
            $0.top.equalTo(passPhotoSubLabel.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(14)
        }
        
        completeButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(24)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }

    func setStyle() {
        backgroundColor = .white
        
        titleLabel.do {
            $0.text = "인증에 필요한 정보들을 \n입력해주세요"
            $0.font = fontStyle.title2_b_17.font()
            $0.textColor = .gray900
            $0.textAlignment = .left
            $0.numberOfLines = 2
        }

        nameLabel.text = "이름"
        phoneLabel.text = "휴대폰 번호"
        passPhotoLabel.text = "합불 화면 캡쳐본"
        nameTextField.placeholder = "  이름을 입력해주세요"
        phoneTextField.placeholder = "  휴대폰 번호를 입력해주세요"
        
        [nameLabel, phoneLabel, passPhotoLabel].forEach {
            $0.do {
                $0.font = fontStyle.body4_b_12.font()
                $0.textColor = .gray900
            }
        }
        
        [nameTextField, phoneTextField].forEach {
            $0.do {
                $0.layer.cornerRadius = 4
                $0.layer.borderColor = UIColor.gray300.cgColor
                $0.layer.borderWidth = 1
                $0.font = fontStyle.body13_r_11.font()
            }
        }
        
        passPhotoSubLabel.do {
            $0.text = "반드시 이름과 합격이라는 단어가 잘 보이도록 촬영해주세요"
            $0.font = fontStyle.label5_m_11.font()
            $0.textColor = .gray600
        }
        
        completeButton.do {
            $0.setTitle("완료", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .gray400
            $0.titleLabel?.font = fontStyle.body3_b_13.font()
            $0.layer.cornerRadius = 8
        }
    }
}
