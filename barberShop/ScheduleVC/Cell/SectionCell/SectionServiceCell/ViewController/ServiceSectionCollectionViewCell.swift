//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ServiceSectionCollectionViewCell: UICollectionViewCell {
    
    private var serviceView: ServiceSectionView = ServiceSectionView()
    
    private var serviceViewModel: ServiceSectionViewModel?
    
    static let identifier: String = "ServiceSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        serviceView.settingsProtocolsSectionCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(serviceView)
        serviceView.pin(to: contentView)
        
    }
    
    public func setupSectionCell(listService: [Service]) { //2
        
        serviceViewModel = ServiceSectionViewModel(listServices: listService)
        
    }
    
}

extension ServiceSectionCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return serviceViewModel?.numberOfItems ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = serviceViewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceDataCollectionViewCell.identifier, for: indexPath) as? ServiceDataCollectionViewCell
        
        cell?.setupDataCell(data: viewModel.loadCurrentDataService(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let spacing: CGFloat = 10
        let numberOfColumns: CGFloat = 2
        let totalSpacing = numberOfColumns * spacing
        
        let cellWidth = (collectionView.bounds.width - totalSpacing) / numberOfColumns
        
        return CGSize(width: cellWidth, height: cellWidth)
        
    }
    
}
