//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ScheduleTimeSectionViewModel {

    private var listScheduleTimes: [ScheduleTime] = []

    init(listScheduleTimes: [ScheduleTime]) {
        
        self.listScheduleTimes = listScheduleTimes
        
    }
    
    public var numberOfItems: Int { return listScheduleTimes.count }
    
    public func loadCurrentDataScheduleTime(indexPath: IndexPath) -> ScheduleTime {
        
        listScheduleTimes[indexPath.row]
        
    }
    
}
