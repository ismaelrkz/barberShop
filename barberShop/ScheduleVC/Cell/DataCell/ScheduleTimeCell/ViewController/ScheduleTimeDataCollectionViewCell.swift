//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ScheduleTimeDataCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ScheduleTimeDataCollectionViewCell"
    
    private var scheduleTimeView: ScheduleTimeDataView = ScheduleTimeDataView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(scheduleTimeView)
        scheduleTimeView.pin(to: self)
        
    }
    
    public func setupDataCell(data: ScheduleTime) {
        
        scheduleTimeView.labelTime.text = data.timeSchedule
        
    }
    
}

