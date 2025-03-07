//
//  SignUpViewController.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit
import FSCalendar

class ScheduleViewController: UIViewController {

    private var scheduleView: ScheduleView?
    
    private var scheduleViewModel: ScheduleViewModel = ScheduleViewModel()
    
    override func loadView() {
        
        scheduleView = ScheduleView()
        
        view = scheduleView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleView?.delegateButton(delegate: self)
        scheduleViewModel.delegateRequest(delegate: self)
        scheduleViewModel.fetchAllRequest()
        
    }

}

extension ScheduleViewController: ScheduleViewModelProtocol {
    
    func success() {

        DispatchQueue.main.async {
            
            self.scheduleView?.settingsProtocolsMainCollectionView(delegate: self, dataSource: self)
            
        }
        
    }
    
    func error() {
        
        print("erro ao popular alguma cell")
        
    }
    
}

extension ScheduleViewController: ScheduleViewDelegate {
    
    func didTapScheduleButton() {
        
        print(#function)
        
    }
    
    func didTapReturnButton() {
        
        print(#function)
        
        navigationController?.popToRootViewController(animated: true)
        
    }

}

extension ScheduleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return scheduleViewModel.numberOfItens

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item % 4 {
            
        case 0: // professional
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfessionalSectionCollectionViewCell.identifier, for: indexPath) as? ProfessionalSectionCollectionViewCell
            
            cell?.setupSectionCell(listProfessional: scheduleViewModel.getListProfessionals)
            
            return cell ?? UICollectionViewCell()
            
        case 1: // service
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceSectionCollectionViewCell.identifier, for: indexPath) as? ServiceSectionCollectionViewCell
            
            cell?.setupSectionCell(listService: scheduleViewModel.getListServices)
            
            return cell ?? UICollectionViewCell()
            
            /*
             
             # Quando for escalar o app, definir camadas de serviço aqui.
             # Cada camada representaria uma sessão de serviço.
             # Exemplo:
             #          Sessão - Barba
             #          Sessão - Cabelo
             #          Sessão - Combo (Cabelo + Barba)
             
             */
            
        case 2: // calendar
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CalendarSectionCollectionViewCell.identifier, for: indexPath) as? CalendarSectionCollectionViewCell
            
            cell?.setupProtocols(delegate: self, dataSource: self)
            
            return cell ?? UICollectionViewCell()
            
        case 3: // scheduleTime
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ScheduleTimeSectionCollectionViewCell.identifier, for: indexPath) as? ScheduleTimeSectionCollectionViewCell
            
            cell?.setupSectionCell(data: scheduleViewModel.getListScheduleTimes)
            
            return cell ?? UICollectionViewCell()
            
        default:
            fatalError("Invalid Index")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return scheduleViewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
        
    }
    
}

extension ScheduleViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        print("Dia selecionado: \(date)") // teste
        
    }
    
    /*
    
    // TODO: configurar eventos do usuário:
     
            # Ao selecionar uma data, deve ser exibido as células* da scheduleTime.
                * Horários disponíveis.
            # Para tal, ao selecionar a data deve ser feito uma requisição no servidor
              buscando os horários disponíveis.
            # Dias anteriores ao dia atual não devem ser possíveis selecionar.
     
    */
    
}
