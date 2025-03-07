    //
    //  SignUpViewModel.swift
    //  barberShop
    //
    //  Created by Ismael Reckziegel on 16/12/24.
    //

    import UIKit
    import FirebaseAuth

    protocol LoginViewModelDelegate {
        
        func successLogin()
        func errorLogin(errorMessage: String)
        
    }

    class LoginViewModel {
        
        private var delegate: LoginViewModelDelegate?
        
        public func delegateLogin(delegate: LoginViewModelDelegate) {
            
            self.delegate = delegate
            
        }

        private let auth = Auth.auth()
        
        public func loginUser(email: String, password: String) {
            
            auth.signIn(withEmail: email, password: password) { authResult, error in
                
                if error == nil {
                    
                    self.delegate?.successLogin()
                    
                } else {
                    
                    print("error: \(error?.localizedDescription ?? "")")
                    
                    self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
                    
                }
                
            }
            
        }
        
    }
