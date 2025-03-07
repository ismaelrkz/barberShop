//
//  SignUpView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit
import SnapKit

protocol ScheduleViewDelegate: AnyObject {
    
    func didTapScheduleButton()
    func didTapReturnButton()
    
}

class ScheduleView: UIView {
    
    private weak var delegate: ScheduleViewDelegate?
    
    public func delegateButton(delegate: ScheduleViewDelegate) {
        
        self.delegate = delegate
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.black
        
        setupViews()
        settingsCollectionViewConstraints()
        settingsActionButtonContainerViewConstraints()

        settingsScheduleButtonConstraints()
        settigsReturnButtonConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var containerCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = true
        cv.backgroundColor = UIColor.systemGray4
        cv.register(ProfessionalSectionCollectionViewCell.self, forCellWithReuseIdentifier: ProfessionalSectionCollectionViewCell.identifier)
        cv.register(ServiceSectionCollectionViewCell.self, forCellWithReuseIdentifier: ServiceSectionCollectionViewCell.identifier)
        cv.register(CalendarSectionCollectionViewCell.self, forCellWithReuseIdentifier: CalendarSectionCollectionViewCell.identifier)
        cv.register(ScheduleTimeSectionCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTimeSectionCollectionViewCell.identifier)

        return cv
        
    }()
    
    public func settingsProtocolsMainCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        containerCollectionView.delegate = delegate
        containerCollectionView.dataSource = dataSource
        
    }
    
    lazy var actionButtonContainerView: UIView = {
        
        let view = UIView()
        view.backgroundColor = UIColor.hippiePinkExt
        
        return view
        
    }()
    
    lazy var scheduleButton: UIButton = {
      
        let button = UIButton()
        button.setTitle("Agendar horário", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.systemGray5
        button.addTarget(self, action: #selector(scheduleButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func scheduleButtonTapped() {
        
        delegate?.didTapScheduleButton()
        
    }
    
    lazy var returnButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func returnButtonTapped() {
        
        delegate?.didTapReturnButton()
        
    }
    
    private func setupViews() {
        
        addSubview(containerCollectionView)
        addSubview(actionButtonContainerView)
        actionButtonContainerView.addSubview(scheduleButton)
        actionButtonContainerView.addSubview(returnButton)
        
    }
    
    private func settingsCollectionViewConstraints() {
        
        containerCollectionView.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(actionButtonContainerView.snp.top).offset(-2)
            
        }
        
    }
    
    private func settingsActionButtonContainerViewConstraints() {
        
        actionButtonContainerView.snp.makeConstraints { make in
            
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(130)
            make.bottom.equalToSuperview()
            
        }
        
    }
    
    private func settingsScheduleButtonConstraints() {
        
        scheduleButton.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaInsets).offset(20)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(40)
            
        }
        
    }
    
    private func settigsReturnButtonConstraints() {
        
        returnButton.snp.makeConstraints { make in
            
            make.top.equalTo(scheduleButton.snp.bottom).offset(10)
            make.leading.equalTo(scheduleButton)
            make.trailing.equalTo(scheduleButton)
            make.height.equalTo(scheduleButton)
            
        }
        
    }

}
