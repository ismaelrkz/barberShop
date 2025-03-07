//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ProfessionalSectionViewModel {
    
    private var listProfessional: [Professional]
    
    init (listProfessional: [Professional]) {
        
        self.listProfessional = listProfessional
    }
    
    public var numberOfItems: Int { listProfessional.count }
    
    public func loadCurrentDataProfessional(indexPath: IndexPath) -> Professional {
        
        listProfessional[indexPath.row]
        
    }

}
