//
//  SignUpViewModel.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit
import FirebaseAuth

protocol SignUpViewModelDelegate: AnyObject {
    
    func successRegister()
    func errorRegister(errorMessage: String)
    
}

class SignUpViewModel {
    
    private weak var delegate: SignUpViewModelDelegate?
    
    public func delegateRegister(delegate: SignUpViewModelDelegate) {
        
        self.delegate = delegate
        
    }
    
    private var auth = Auth.auth()
    
    public func registerUser(email: String, password: String) {
     
        auth.createUser(withEmail: email, password: password) { authResult, error in
            
            if error == nil {
                
                self.delegate?.successRegister()
                
            } else {
                
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
                
                print("error: \(error?.localizedDescription ?? "")")
                
            }
            
        }
        
    }
    
}
