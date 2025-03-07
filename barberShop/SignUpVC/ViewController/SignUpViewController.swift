//
//  SignUpViewController.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private var signUpView: SignUpView?
    
    private var signUpViewModel: SignUpViewModel = SignUpViewModel()
    
    override func loadView() {
        
        signUpView = SignUpView()
        
        view = signUpView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView?.delegateButton(delegate: self)
        signUpView?.delegateTextFields(delegate: self)
        signUpViewModel.delegateRegister(delegate: self)
        
    }
    
}

extension SignUpViewController: SignUpViewDelegate {
    
    func didTapRegisterButton() {
        
        signUpViewModel.registerUser(email: signUpView?.emailTextField.text ?? "", password: signUpView?.passwordTextField.text ?? "")
        
    }
    
    func didTapReturnButton() {
        
        navigationController?.popToRootViewController(animated: true)
        
    }
    
}

extension SignUpViewController: SignUpViewModelDelegate {
    
    func successRegister() {
        
        Alert(controller: self).showAlertInformation(tittle: "Sucesso no cadastro", message: "Clique em OK para continuar") {
            
            let schedule: ScheduleViewController = ScheduleViewController()
            
            self.navigationController?.setViewControllers([schedule], animated: true)
        
        }
        
    }
    
    func errorRegister(errorMessage: String) {
        
        Alert(controller: self).showAlertInformation(tittle: "Ops, erro no cadastro", message: errorMessage)
        
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        print(#function)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        print(#function)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == signUpView?.emailTextField {
            
            signUpView?.passwordTextField.becomeFirstResponder()
            
        } else if textField == signUpView?.passwordTextField {
            
            signUpView?.passwordTextField.resignFirstResponder()
            
        }
        
        return true
        
    }
    
}

