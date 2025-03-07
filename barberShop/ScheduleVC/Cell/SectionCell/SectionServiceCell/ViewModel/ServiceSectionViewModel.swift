//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ServiceSectionViewModel {

    private var listServices: [Service]
    
    init(listServices: [Service]) {
        
        self.listServices = listServices
        
    }
    
    public var numberOfItems: Int { return listServices.count }
    
    public func loadCurrentDataService(indexPath: IndexPath) -> Service {
        
        listServices[indexPath.row]
        
    }

}
