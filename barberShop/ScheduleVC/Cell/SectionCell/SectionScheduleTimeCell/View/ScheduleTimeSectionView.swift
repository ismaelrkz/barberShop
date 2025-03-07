//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import SnapKit

class ScheduleTimeSectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.ashExt
        
        setupViews()
        settingsCollectionViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var collectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let cv: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        cv.showsHorizontalScrollIndicator = false
        cv.register(ScheduleTimeDataCollectionViewCell.self, forCellWithReuseIdentifier: ScheduleTimeDataCollectionViewCell.identifier)
        
        return cv
        
    }()
    
    public func settingsProtocolsSectionCollectionView(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
        
    }
    
    private func setupViews() {
        
        addSubview(collectionView)
        
    }
    
    private func settingsCollectionViewConstraints() {
        
        collectionView.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            
        }
        
    }
    
}
