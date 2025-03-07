//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ProfessionalSectionCollectionViewCell: UICollectionViewCell {
    
    private var professionalView: ProfessionalSectionView = ProfessionalSectionView()
    
    private var professionalViewModel: ProfessionalSectionViewModel?
    
    static let identifier: String = "ProfessionalSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        professionalView.settingsProtocolsSectionCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(professionalView)
        professionalView.pin(to: contentView)
        
    }
    
    public func setupSectionCell(listProfessional: [Professional]) {
        
        professionalViewModel = ProfessionalSectionViewModel(listProfessional: listProfessional)
        
    }
    
}

extension ProfessionalSectionCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return professionalViewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = professionalViewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfessionalDataCollectionViewCell.identifier, for: indexPath) as? ProfessionalDataCollectionViewCell
        
        cell?.setupDataCell(data: viewModel.loadCurrentDataProfessional(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
        
    }
    
}

