//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import FSCalendar

class CalendarSectionCollectionViewCell: UICollectionViewCell {
    
    private var calendarView: CalendarSectionView = CalendarSectionView()
    
//    private var calendarViewModel: CalendarSectionViewModel?
    
    static let identifier: String = "CalendarSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(calendarView)
        calendarView.pin(to: contentView)
        
    }
    
    public func setupProtocols(delegate: FSCalendarDelegate, dataSource: FSCalendarDataSource) {
                
        calendarView.settingsProtocolsDataCalendarView(delegate: delegate, dataSource: dataSource)
        
    }
    
}
