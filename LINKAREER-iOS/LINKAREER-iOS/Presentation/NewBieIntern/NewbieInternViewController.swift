//
//  NewbieIntern.swift
//  LINKAREER-iOS
//
//  Created by Jaehyun Ahn on 11/20/24.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class NewbieInternViewController: UIViewController {

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 16
        $0.sectionInset = UIEdgeInsets(
            top: 16,
            left: 16,
            bottom: 16,
            right: 16)
    }).then {
        $0.backgroundColor = .white
    }


    private var horizontalScrollData: [CompanyDayCardDataModel] = []
    private var otherSectionData: [String] = [] // 더미 데이터

    override func viewDidLoad() {
        super.viewDidLoad()
        setHierarchy()
        setStyle()
        setRegister()
        setLayout()
        fetchData()
        setDelegate()
    }
    
}

extension NewbieInternViewController {

    // 추후 추가된 뷰를 위해 함수 선언
    private func setHierarchy(){
        view.addSubview(collectionView)
    }
    
    private func setStyle() {
        collectionView.backgroundColor = .white
    }
    
    private func setRegister() {
        collectionView.register(CompanyHorizontalScrollViewCell.self, forCellWithReuseIdentifier: CompanyHorizontalScrollViewCell.identifier)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: UICollectionViewCell.identifier)
    }
    
    private func setDelegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setLayout() {
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    //임시 데이터
    private func fetchData() {
        horizontalScrollData = (1...10).map { i in
            CompanyDayCardDataModel(
                day: "\(i)",
                image: UIImage(named: "img_hotofficial_ibk_142") ?? UIImage(systemName: "photo")!,
                buttonTitle: "지원하기",
                companyName: "회사 \(i)",
                title: "2025년 채용 공고 \(i)",
                category: "정규직",
                viewCount: 1000 + i * 10,
                commentCount: i * 2
            )
        }
        otherSectionData = (1...5).map { "더미 데이터 \($0)" }
        collectionView.reloadData()
    }
}

extension NewbieInternViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3 //임시 섹션 3개
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // 일단 첫 번째 섹션은 가로 스크롤
        case 1, 2:
            return otherSectionData.count // 나머지 섹션은 더미 데이터 사용
        default:
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CompanyHorizontalScrollViewCell.identifier, for: indexPath) as! CompanyHorizontalScrollViewCell
            cell.configure(with: horizontalScrollData)
            return cell
        } else {
            return configureDummyCell(for: collectionView, at: indexPath)
        }
    }

    private func configureDummyCell(for collectionView: UICollectionView, at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UICollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .lightGray

        let label = UILabel().then {
            $0.text = otherSectionData[indexPath.item]
            $0.textColor = .black
            $0.font = UIFont.systemFont(ofSize: 14)
            $0.textAlignment = .center
        }

        cell.contentView.addSubview(label)
        label.snp.makeConstraints { $0.edges.equalToSuperview() }
        return cell
    }

    // 레이아웃
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width - 32, height: 255)
        } else {
            //더미
            return CGSize(width: collectionView.frame.width - 32, height: 50)
        }
    }

}


//preview

struct NewbieInternViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NewbieInternViewController {
        return NewbieInternViewController()
    }

    func updateUIViewController(_ uiViewController: NewbieInternViewController, context: Context) {}
}

struct NewbieInternViewControllerPreview_Previews: PreviewProvider {
    static var previews: some View {
        NewbieInternViewControllerPreview()
            .edgesIgnoringSafeArea(.all)
    }
}
