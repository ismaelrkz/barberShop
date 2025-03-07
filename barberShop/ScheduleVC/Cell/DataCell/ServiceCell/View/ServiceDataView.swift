//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit
import SnapKit

class ServiceDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        settingsServiceImageConstraints()
        settingsServiceLabelConstraints()
        settingsPriceServiceConstraints()
        settingsWaitingLabelConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageService: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.systemGray5
        imageView.tintColor = UIColor.black
        imageView.contentMode = .center
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        
        return imageView
        
    }()
    
    @objc func imageTapped() {
        
        print("Serviço pressionado")
        
    }
    
    
    
    lazy var labelService: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = UIColor.systemGray5
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var labelPriceService: UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textColor = UIColor.systemGray5
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var labelWaitingService: UILabel = {
        
        let label = UILabel()
        label.text = "15min"
        label.backgroundColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 12 // verificar!!!
        label.clipsToBounds = true
        return label
        
    }()
    
    private func setupViews() {
        
        addSubview(imageService)
        addSubview(labelService)
        addSubview(labelPriceService)
        imageService.addSubview(labelWaitingService)
        
    }
    
    private func settingsServiceImageConstraints() {
        
        imageService.snp.makeConstraints { make in
            
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100)
            
        }
        
    }
    
    private func settingsServiceLabelConstraints() {
        
        labelService.snp.makeConstraints { make in
            
            make.top.equalTo(imageService.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().inset(2)
            
        }
        
    }
    
    private func settingsPriceServiceConstraints() {
        
        labelPriceService.snp.makeConstraints { make in
            
            make.top.equalTo(labelService.snp.bottom).offset(2)
            make.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview().offset(2)
            make.trailing.equalToSuperview().inset(2)
            
        }
        
    }
    
    private func settingsWaitingLabelConstraints() {
        
        labelWaitingService.snp.makeConstraints { make in
            
            make.trailing.equalTo(imageService.snp.trailing)
            make.bottom.equalTo(imageService.snp.bottom)
            make.height.equalTo(25)
            make.width.equalTo(60)
            
        }
        
    }
    
    
}
