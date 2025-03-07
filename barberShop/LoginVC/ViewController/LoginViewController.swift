//
//  ViewController.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 04/12/24.
//

import UIKit

class LoginViewController: UIViewController {

    var loginView: LoginView?
    
    private var loginInViewModel: LoginViewModel = LoginViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    override func loadView() {
        
        loginView = LoginView()
        
        view = loginView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: documentar delegateTextFields!
        loginView?.delegateButton(delegate: self)
        loginView?.delegateTextFields(delegate: self)
        loginInViewModel.delegateLogin(delegate: self)
        
    }
    
    deinit {
        print("LoginViewController foi desalocada.")
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
//        print(#function)
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
//        print(#function)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginView?.emailTextField {
            
            loginView?.passwordTextField.becomeFirstResponder()
            
        } else if textField == loginView?.passwordTextField {
            
            loginView?.passwordTextField.resignFirstResponder()
            
        }
        
        return true
        
    }
    
}

extension LoginViewController: LoginViewDelegate {
    
    func didTapScheduleButton() {
        
        let schedule: ScheduleViewController = ScheduleViewController()
        
        navigationController?.pushViewController(schedule, animated: true)
        
    }

    func didTapSignInButton() {
        
        loginInViewModel.loginUser(email: loginView?.emailTextField.text ?? "", password: loginView?.passwordTextField.text ?? "")
        
    }
    
    func didTapSignUpButton() {
        
        let signUp: SignUpViewController = SignUpViewController()
        
        navigationController?.pushViewController(signUp, animated: true)
        
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    
    func successLogin() {
        
        Alert(controller: self).showAlertInformation(tittle: "Bem-vindo!", message: "Seu Login foi realizado com sucesso, será um prazer lhe atender!") {
            
            let schedule: ScheduleViewController = ScheduleViewController()
            
            self.navigationController?.setViewControllers([schedule], animated: true)
            
        }
        
    }
    
    func errorLogin(errorMessage: String) {
        
        Alert(controller: self).showAlertInformation(tittle: "Ops, erro no login", message: errorMessage)
        
    }

}
