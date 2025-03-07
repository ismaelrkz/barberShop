//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import SnapKit

class ScheduleTimeDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupView()
        settingsLabelTimeConstrainsts()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var labelTime: UILabel = {
        
        let label: UILabel = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.backgroundColor = UIColor.systemGreen
        label.layer.cornerRadius = 12
        label.clipsToBounds = true
        label.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        
        label.addGestureRecognizer(tapGesture)
        
        return label
        
    }()
    
    @objc func labelTapped() {
        print("Horário pressionado")
    }
    
    private func setupView() {
        
        addSubview(labelTime)
        
    }
    
    private func settingsLabelTimeConstrainsts() {
        
        labelTime.pin(to: self)
        
    }
    
}
