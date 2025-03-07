//
//  SignUpViewModel.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit

protocol ScheduleViewModelProtocol: AnyObject {
    
    func success()
    func error()
    
}

class ScheduleViewModel {
    
    private var service: ScheduleService = ScheduleService()
    
    private weak var delegate: ScheduleViewModelProtocol?
    
    public func delegateRequest(delegate: ScheduleViewModelProtocol) {
        
        self.delegate = delegate
        
    }
    
    private var professionals = [Professional]()
    
    private var services = [Service]()
    
    private var scheduleTimes: [ScheduleTime] = []
    
    public var getListProfessionals: [Professional] { professionals }
    
    public var getListServices: [Service] { services }
    
    public var getListScheduleTimes: [ScheduleTime] { scheduleTimes }
    
    public func fetchAllRequest() {
        
        service.getScheduleDataJson { scheduleData, error in
            
            if scheduleData != nil {
                
                self.professionals = scheduleData?.professionalSection ?? []
                self.services = scheduleData?.serviceSection ?? []
                // TODO: atribuir os dados aos outros objetos das seguintes sessões:
                // - Calendar
                self.scheduleTimes = scheduleData?.scheduleTimeSection ?? []
                self.delegate?.success()
                
            } else {
            
                self.delegate?.error()
                
            }
            
        }
        
    }
    
    public var numberOfItens: Int { return 4 }
    
    public func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        
        switch indexPath.row % 4 {
            
        case 0:
            
            return CGSize(width: frame.width, height: 130)
            
        case 1:
            
            return CGSize(width: frame.width, height: 400)
            
        case 2:
            
            return CGSize(width: frame.width, height: 400)
            
        case 3:
            
            return CGSize(width: frame.width, height: 130)
            
        default:
            
            return CGSize(width: frame.width, height: frame.height)
            
        }
        
    }
    
}
