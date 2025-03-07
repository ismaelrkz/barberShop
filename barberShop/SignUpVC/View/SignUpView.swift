//
//  SignUpView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 16/12/24.
//

import UIKit
import SnapKit

protocol SignUpViewDelegate: AnyObject {
    
    func didTapRegisterButton()
    func didTapReturnButton()
    
}

class SignUpView: UIView {
    
    private weak var delegate: SignUpViewDelegate?
    
    public func delegateButton(delegate: SignUpViewDelegate) {
        
        self.delegate = delegate
        
    }
    
    public func delegateTextFields(delegate: UITextFieldDelegate) {
        
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        settingsLogoImageViewConstraints()
        settingsRegisterLabelViewConstraints()
        settingsEmailTextFieldViewConstraints()
        settingsPasswordTextFieldViewConstraints()
        settingsRegisterButtonConstraints()
        settingsReturnButtonConstraints()
        
        backgroundColor = UIColor.hippiePinkExt // editar!!!
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var logoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chair.lounge.fill") // Editar!!!
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    lazy var registerLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Cadastre-se para ter acesso aos nossos serviços!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = UIColor.systemGray5
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
        
    }()
    
    lazy var emailTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = UIColor.white
        return textField
        
    }()
    
    lazy var passwordTextField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.textColor = UIColor.black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 20
        textField.backgroundColor = UIColor.white
        return textField
        
    }()
    
    lazy var registerButton: UIButton = {
      
        let button = UIButton()
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.backgroundColor = UIColor.systemGray5
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func registerButtonTapped() {
        
        delegate?.didTapRegisterButton()
        
    }
    
    lazy var returnButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Voltar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        button.addTarget(self, action: #selector(returnButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func returnButtonTapped() {
        
        delegate?.didTapReturnButton()
        
    }
    
    private func setupViews() {
        
        addSubview(logoImageView)
        addSubview(registerLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
        addSubview(returnButton)
        
    }
    
    private func settingsLogoImageViewConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(90)
            
        }
        
    }
    
    private func settingsRegisterLabelViewConstraints() {
        
        registerLabel.snp.makeConstraints { make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            
        }
        
    }
    
    private func settingsEmailTextFieldViewConstraints() {
        
        emailTextField.snp.makeConstraints { make in
            
            make.top.equalTo(registerLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(40)
            
        }
        
    }
    
    private func settingsPasswordTextFieldViewConstraints() {
        
        passwordTextField.snp.makeConstraints { make in
            
            make.top.equalTo(emailTextField.snp.bottom).offset(30)
            make.leading.equalTo(emailTextField)
            make.trailing.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
            
        }
        
    }
    
    private func settingsRegisterButtonConstraints() {
        
        registerButton.snp.makeConstraints { make in
            
            make.top.equalTo(passwordTextField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(40)
            
        }
        
    }
    
    private func settingsReturnButtonConstraints() {
        
        returnButton.snp.makeConstraints { make in
            
            make.top.equalTo(registerButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(registerButton)
            
        }
        
    }
    
}
