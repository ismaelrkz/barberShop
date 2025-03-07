//
//  UIView + Extension.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 17/01/25.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    
    func pin(to superView: UIView) {
        
        self.snp.makeConstraints { make in
            make.top.equalTo(superView.snp.top)
            make.bottom.equalTo(superView.snp.bottom)
            make.leading.equalTo(superView.snp.leading)
            make.trailing.equalTo(superView.snp.trailing)
        }
    }

}
