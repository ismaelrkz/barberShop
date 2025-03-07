//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ProfessionalDataCollectionViewCell: UICollectionViewCell {
    
    private var professionalDataView: ProfessionalDataView = ProfessionalDataView()
    
    static let identifier: String = "ProfessionalDataCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func settingsView() {
        
        contentView.addSubview(professionalDataView)
        professionalDataView.pin(to: self)
        
    }
    
    public func setupDataCell(data: Professional) {
        
        professionalDataView.imageProfile.image = UIImage(named: data.profileImage ?? "")
        
    }
    
}

