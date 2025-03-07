//
//  CalendarCellUIView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import UIKit

class ProfessionalDataView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        settingsImageProfileConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var imageProfile: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 90, height: 90)
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true // interação do usuário liberada
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageView.addGestureRecognizer(tapGesture)
        
        return imageView
        
    }()
    
    @objc func imageTapped() {
        print("Profissional pressionado")
    }
    
    // TODO: add label (nome)
    
    private func setupViews() {
        
        addSubview(imageProfile)
        
    }
    
    private func settingsImageProfileConstraints() {
        
        imageProfile.pin(to: self)
        
    }
    
}
