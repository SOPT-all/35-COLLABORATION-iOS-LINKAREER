//
//  ForJobSuccessHeaderView.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/21/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class ForJobSuccessHeaderView: UIView {

    private let titleLabel : UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle(){
        
        backgroundColor = .white
        
        titleLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray800,
            font: fontStyle.body2_b_14.font()
        )
    }

    private func setHierarchy() {
        addSubview(titleLabel)
    }
    
    private func setLayout() {
        
        titleLabel.snp.makeConstraints { $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-14)
            $0.top.equalToSuperview().offset(10)
            
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
}

// MARK: - Preview

struct ForJobSuccessHeaderViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> ForJobSuccessHeaderView {
        let headerView = ForJobSuccessHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        headerView.configure(title: "질문방")
        return headerView
    }

    func updateUIView(_ uiView: ForJobSuccessHeaderView, context: Context) {}
}

struct ForJobSuccessHeaderViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        ForJobSuccessHeaderViewPreview()
   
    }
}
