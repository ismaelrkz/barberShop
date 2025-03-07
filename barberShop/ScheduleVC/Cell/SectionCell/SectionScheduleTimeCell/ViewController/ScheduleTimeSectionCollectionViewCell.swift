//
//  CalendarCellCollectionViewCell.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ScheduleTimeSectionCollectionViewCell: UICollectionViewCell {
    
    private var scheduleTimeView: ScheduleTimeSectionView = ScheduleTimeSectionView()
    
    private var scheduleTimeViewModel: ScheduleTimeSectionViewModel?
    
    static let identifier: String = "ScheduleTimeSectionCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingsView()
        scheduleTimeView.settingsProtocolsSectionCollectionView(delegate: self, dataSource: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func settingsView() {
        
        contentView.addSubview(scheduleTimeView)
        scheduleTimeView.pin(to: contentView)
        
    }
    
    public func setupSectionCell(data: [ScheduleTime]) {
        
        scheduleTimeViewModel = ScheduleTimeSectionViewModel(listScheduleTimes: data)
        
    }
    
}

extension ScheduleTimeSectionCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return scheduleTimeViewModel?.numberOfItems ?? 00
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let viewModel = scheduleTimeViewModel else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleTimeDataCollectionViewCell.identifier, for: indexPath) as? ScheduleTimeDataCollectionViewCell
        
        cell?.setupDataCell(data: viewModel.loadCurrentDataScheduleTime(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
        
    }
    
}
