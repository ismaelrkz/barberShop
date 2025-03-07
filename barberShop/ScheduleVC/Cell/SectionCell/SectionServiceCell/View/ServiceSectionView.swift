//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import SnapKit

class ServiceSectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.nandorExt
        
        setupView()
        settingsCollectionViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.register(ServiceDataCollectionViewCell.self, forCellWithReuseIdentifier: ServiceDataCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    public func settingsProtocolsSectionCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    private func setupView() {
        
        addSubview(collectionView)
        
    }
    
    private func settingsCollectionViewConstraints() {
        
        collectionView.snp.makeConstraints { make in
            
            make.top.equalToSuperview().inset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview().inset(10)
            
        }
        
    }
    
}
