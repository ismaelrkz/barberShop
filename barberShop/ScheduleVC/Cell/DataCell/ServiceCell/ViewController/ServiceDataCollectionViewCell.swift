//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ServiceDataCollectionViewCell: UICollectionViewCell {
    
    private var serviceDataView: ServiceDataView = ServiceDataView()
    
    static let identifier: String = "ServiceDataCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(serviceDataView)
        serviceDataView.pin(to: self)
        
    }
    
    public func setupDataCell(data: Service) { //6
        
        serviceDataView.imageService.image = UIImage(named: data.imageService ?? "")
        serviceDataView.labelService.text = data.labelService
        serviceDataView.labelPriceService.text = String(format: "R$ %.2f", data.labelPriceService ?? 00.00)
        serviceDataView.labelWaitingService.text = "\(Int(data.labelWaitingService ?? 0))min"
        
    }
    
    
}

