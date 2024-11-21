//
//  ChatCertificationProcedureViewController.swift
//  LINKAREER-iOS
//
//  Created by Gahyun Kim on 11/21/24.
//

import UIKit
import Combine

import Then
import SnapKit

final class ChatCertificationProcedureViewController: UIViewController {
    
    private let rootView = ChatCertificationProcedureView()
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setHierarchy()
        setLayout()
        
        isEnabledCompleteButton()
        setAddTarget()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}

extension ChatCertificationProcedureViewController {
    
    func setHierarchy() {
        view.addSubview(rootView)
    }
    
    func setLayout() {
        rootView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func isEnabledCompleteButton() {
        let namePublisher = rootView.nameTextField.textFieldPublisher
            .map { !$0.isEmpty }
        
        let phonePublisher = rootView.phoneTextField.textFieldPublisher
            .map { !$0.isEmpty }
        
        Publishers.CombineLatest(namePublisher, phonePublisher)
            .map { $0 && $1 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isValid in
                guard let self = self else { return }
                self.rootView.completeButton.isEnabled = isValid
                self.rootView.completeButton.backgroundColor = isValid ? .lkBlue : .gray400
            }
            .store(in: &cancellables)
    }
    
    func setAddTarget() {
        rootView.completeButton.addTarget(self, action: #selector(completeButtonDidTapped), for: .touchUpInside)
        rootView.passPhotoButton.addTarget(self, action: #selector(passPhotoButtonDidTapped), for: .touchUpInside)
    }
    
    @objc func completeButtonDidTapped() {
        let nextViewController = ChatCertificationCompleteViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func passPhotoButtonDidTapped() {
        rootView.passPhotoButton.setImage(.imgImgregistOrion, for: .normal)
        rootView.passPhotoButton.setTitle("", for: .normal)
        rootView.passPhotoButton.imageView?.contentMode = .scaleAspectFill
        rootView.passPhotoButton.contentHorizontalAlignment = .fill
        rootView.passPhotoButton.contentVerticalAlignment = .fill
        rootView.passPhotoButton.imageEdgeInsets = .zero
    }
}

extension UITextField {
    var textFieldPublisher: AnyPublisher<String, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { ($0.object as? UITextField)?.text }
            .eraseToAnyPublisher()
    }
}
