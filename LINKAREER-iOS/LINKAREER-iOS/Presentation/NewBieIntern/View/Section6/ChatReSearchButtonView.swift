//
//  ChatReSearchButtonView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/25/24.
//

import UIKit

import SnapKit
import Then

final class ChatReSearchButtonView: UIView {

    private let button: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setStyle()
        setLayout()
        setActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setHierarchy() {
        addSubview(button)
    }
    
    private func setStyle() {

        button.do {
            $0.setTitle("다른 채팅방 보기", for: .normal)
            $0.setTitleColor(.gray700, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            $0.setImage(UIImage(resource: .icArrowRefresh), for: .normal) // 아이콘
            $0.imageView?.contentMode = .scaleAspectFit
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 20
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.gray300.cgColor
            $0.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
            $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8) 
        }
    }

    private func setLayout() {
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
     
        }
    }
    
    private func setActions() {
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        print("muyaho~~") 
    }
}




import SwiftUI

struct ChatReSearchButtonView_Preview: PreviewProvider {
    static var previews: some View {
        ChatReSearchButtonViewWrapper()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

struct ChatReSearchButtonViewWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return ChatReSearchButtonView()
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
