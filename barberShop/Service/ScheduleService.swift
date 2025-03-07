//
//  ScheduleService.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 25/01/25.
//

import UIKit

class ScheduleService {
    
    //  TODO: modificar estrutra JSON para suportar múltiplas sections
        //  #caso o arquivo JSON fique muito grande,
        //  estudar possibilidade de rodar o método em Background Thread.
        //  ex: DispatchQueue.global(qos: .background).async
    
    
    //  MARK: requisição teste mock - dados json decodificados
    func getScheduleDataJson(completion: @escaping(ScheduleData?, Error?) -> Void) {
        
        if let url = Bundle.main.url(forResource: "MockSections", withExtension: "json") {
            
            do {
                
                let data = try Data(contentsOf: url)
                let scheduleData: ScheduleData = try JSONDecoder().decode(ScheduleData.self, from: data)
                
                completion(scheduleData, nil)
                
            } catch {
                
                completion(nil, error)
                
                print("Json não decodificado na Service: \(error.localizedDescription)")
                
            }
            
        }
        
    }
    
}

/*
    // TODO: importar Alamofire (add framework no podfile)
    // MARK: Método para usar request do Alamofire - REQUISIÇÃO URL
    func getHomeDataJsonAlamofire(completion: @escaping(ScheduleData? , Error?) -> Void) {
        
        let url: String = "passar url da API"
        
        AF.request(url, method: .get).validate().responseDecodable(of: ScheduleData.self) { response in
            
            debugPrint(response)
            
            switch response.result {
                
            case .success(let success):
                
                print("SUCCESS\(#function)")
                completion(success, nil)
                
            case .failure(let error):
                
                print("ERROR\(#function)")
                completion(nil, error)
                
            }
            
        }
        
    }
*/


