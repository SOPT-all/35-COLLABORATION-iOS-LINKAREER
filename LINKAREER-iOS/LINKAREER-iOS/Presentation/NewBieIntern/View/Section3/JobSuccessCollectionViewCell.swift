//
//  JobSuccessCollectionViewCell.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/21/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

//민서공이s header 추가 예정
class JobSuccessCollectionViewCell: UICollectionViewCell {
    
    private var collectionView: UICollectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
    
    private var data: [SectionTitleModel] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierarchy()
        setLayout()
        setDelegate()
        setStyle()
        registerCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setHierarchy() {
        addSubview(collectionView)
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    private func setDelegate() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setStyle() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 380, height: 180)
            
        }
        collectionView.backgroundColor = .clear
    }

    private func registerCell() {
        collectionView.register(ForJobSuccessCollectionViewCell.self, forCellWithReuseIdentifier: ForJobSuccessCollectionViewCell.identifier)
    }

    func configure(with sections: [SectionTitleModel]) {
            self.data = sections
            collectionView.reloadData()
        }
}

extension JobSuccessCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // 각 섹션에 하나의 셀만 존재하게
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ForJobSuccessCollectionViewCell.identifier,
            for: indexPath
        ) as? ForJobSuccessCollectionViewCell else {
            return UICollectionViewCell()
        }

        // 섹션의 데이터를 해당 셀에 전달⭐️
        let sectionData = data[indexPath.section]
        cell.configure(with: sectionData)

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0 // 섹션 간 간격
    }
    
}

// MARK: - SwiftUI Preview

struct JobSuccessCollectionViewPreview: UIViewRepresentable {
    func makeUIView(context: Context) -> JobSuccessCollectionViewCell {
        let view = JobSuccessCollectionViewCell(frame: .init(x: 0, y: 0, width: 555, height: 700))
        
        let dummyData = JobSuccessDummyData.shared.allSections
        view.configure(with: dummyData)
        
        return view
    }

    func updateUIView(_ uiView: JobSuccessCollectionViewCell, context: Context) {}
}

struct JobSuccessCollectionViewPreview_Previews: PreviewProvider {
    static var previews: some View {
        JobSuccessCollectionViewPreview()
            .previewLayout(.sizeThatFits)
            .frame(width: 400, height: 600)
            .padding()
    }
}
