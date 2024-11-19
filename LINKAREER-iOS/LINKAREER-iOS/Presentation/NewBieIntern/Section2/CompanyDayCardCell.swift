//
//  CompanyDayCardCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/19/24.
//
import UIKit
import SwiftUI

import SnapKit
import Then

class CompanyDayCardCell: UIView {
    
    private let boxView = UIView()
    private let dayLabel = PaddedUILabel()
    private let categoryLabel = PaddedUILabel()
    private let logoImageView = UIImageView()
    private let actionButton = UIButton()
    private let companyNameLabel = UILabel()
    private let titleLabel = UILabel()
    private let viewCountLabel = UILabel()
    private let commentCountLabel = UILabel()

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
        
        backgroundColor = .white
  
        boxView.backgroundColor = .gray100
        boxView.layer.cornerRadius = 10
        boxView.layer.masksToBounds = true

        dayLabel.setLabel(
            text: nil,
            alignment: .center,
            numberOfLines: 1,
            textColor: .white,
            font: fontStyle.label7_m_9.font()
        )
        dayLabel.backgroundColor = .black
        dayLabel.layer.cornerRadius = 4
        dayLabel.layer.masksToBounds = true
        dayLabel.padding = UIEdgeInsets(
            top: 2,
            left: 4,
            bottom: 2,
            right: 4)

        companyNameLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.body9_m_12.font()
        )

        titleLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray900,
            font: fontStyle.body3_b_13.font()
        )

        categoryLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .systemBlue,
            font: fontStyle.label7_m_9.font()
        )
        categoryLabel.backgroundColor = .blue100
        categoryLabel.layer.cornerRadius = 4
        categoryLabel.layer.masksToBounds = true
        categoryLabel.padding = UIEdgeInsets(
            top: 2,
            left: 4,
            bottom: 2,
            right: 4)

        viewCountLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.label7_m_9.font()
        )

        commentCountLabel.setLabel(
            text: nil,
            alignment: .left,
            numberOfLines: 1,
            textColor: .gray600,
            font: fontStyle.label7_m_9.font()
        )

        logoImageView.contentMode = .scaleAspectFit
        logoImageView.clipsToBounds = true

        actionButton.setImage(
            UIImage(named: "ic_bookmark_w_default")?.withRenderingMode(.alwaysTemplate),
            for: .normal
        )
        actionButton.tintColor = .black
        actionButton.backgroundColor = .clear

        
    }
    
    private func setHierarchy() {
        [boxView, dayLabel, logoImageView, actionButton, companyNameLabel, titleLabel, categoryLabel, viewCountLabel, commentCountLabel]
            .forEach { addSubview($0) }
    }


    private func setLayout() {
        boxView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(142)
        }

        dayLabel.snp.makeConstraints {
            $0.leading.equalTo(boxView.snp.leading).offset(10)
            $0.top.equalTo(boxView.snp.top).offset(10)
            $0.width.height.lessThanOrEqualTo(40)
        }

        logoImageView.snp.makeConstraints {
            $0.centerX.equalTo(boxView.snp.centerX)
            $0.centerY.equalTo(boxView.snp.centerY)
        }

        actionButton.snp.makeConstraints {
            $0.top.equalTo(boxView.snp.top)
            $0.trailing.equalTo(boxView.snp.trailing)
            $0.height.width.equalTo(36)
        }

        companyNameLabel.snp.makeConstraints {
            $0.top.equalTo(boxView.snp.bottom).offset(8)
            $0.horizontalEdges.equalTo(boxView)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(companyNameLabel.snp.bottom).offset(2)
            $0.horizontalEdges.equalTo(boxView)
        }

        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(24)
            $0.leading.equalTo(boxView.snp.leading)
        }

        viewCountLabel.snp.makeConstraints {
            $0.top.equalTo(categoryLabel.snp.bottom).offset(8)
            $0.leading.equalTo(boxView.snp.leading)
        }

        commentCountLabel.snp.makeConstraints {
            $0.centerY.equalTo(viewCountLabel)
            $0.leading.equalTo(viewCountLabel.snp.trailing).offset(3)
        }

        snp.makeConstraints {
            $0.height.equalTo(255)
            $0.width.equalTo(142)
        }
    }

    func configure(
        day: String,
        image: UIImage,
        buttonTitle: String,
        companyName: String,
        title: String,
        category: String,
        viewCount: Int,
        commentCount: Int
    ) {
        dayLabel.text = "D-\(day)"
        logoImageView.image = image
        actionButton.setTitle(buttonTitle, for: .normal)
        companyNameLabel.text = companyName
        titleLabel.text = title
        categoryLabel.text = category
        viewCountLabel.text = "조회수 \(viewCount)"
        commentCountLabel.text = "댓글 \(commentCount)"
    }
}

// MARK: - PreView

struct CompanyDayCardCellPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> CompanyDayCardCell {
        let cell = CompanyDayCardCell(frame: CGRect(x: 0, y: 0, width: 194, height: 1004))
        cell.configure(
            day: "3",
            image: UIImage(named: "img_hotofficial_ibk_142") ?? UIImage(systemName: "photo")!,
            buttonTitle: "지원하기",
            companyName: "IBK 기업은행",
            title: "2025년 마케팅 인턴 모집",
            category: "정규직",
            viewCount: 12000,
            commentCount: 100
        )
        return cell
    }

    func updateUIView(_ uiView: CompanyDayCardCell, context: Context) {}
}

struct CompanyDayCardCellPreview_Previews: PreviewProvider {
    static var previews: some View {
        CompanyDayCardCellPreview()
    }
}
