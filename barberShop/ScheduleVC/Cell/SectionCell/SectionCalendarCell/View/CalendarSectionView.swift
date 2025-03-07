//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import FSCalendar

class CalendarSectionView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.santaFeExt
        
        setupViews()
        settingsCalendarViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var calendarView: FSCalendar = {
        
        let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        
        // TODO: Configurar calendário
        
        calendar.allowsSelection = true
        
        return calendar
        
    }()
    
    public func settingsProtocolsDataCalendarView(delegate: FSCalendarDelegate, dataSource: FSCalendarDataSource) {
        
        calendarView.delegate = delegate
        calendarView.dataSource = dataSource
        
    }

    
    private func setupViews() {
        
        addSubview(calendarView)
        
    }

    private func settingsCalendarViewConstraints() {
        
        calendarView.pin(to: self)
        
    }
    
}
