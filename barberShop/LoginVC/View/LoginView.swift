//
//  LoginView.swift
//  barberShop
//
//  Created by Ismael Reckziegel on 05/12/24.
//

import UIKit
import SnapKit

protocol LoginViewDelegate: AnyObject {
    
    func didTapScheduleButton()
    func didTapSignInButton()
    func didTapSignUpButton()
    
}

class LoginView: UIView {
    
    private weak var delegate: LoginViewDelegate?
    
    public func delegateButton(delegate: LoginViewDelegate) {
        
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
        settingsWelcomeLabelConstraints()
        settingsScheduleButtonConstraints()
        settingsSignInLabelConstraints()
        settingsEmailTextFieldConstraints()
        settingsPasswordTextFieldConstraints()
        settingsSignInButtonConstraints()
        settingsSignUpLabelConstraints()
        settingsSignUpButtonConstraints()
        
        backgroundColor = UIColor.bismarkExt
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var logoImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chair.lounge.fill")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    lazy var welcomeLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Bem vindo ao BarberShop!"
        label.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        label.textColor = .systemGray5
        return label
        
    }()
    
    lazy var scheduleButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Agende seu horário", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(scheduleButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func scheduleButtonTapped() {
        
        delegate?.didTapScheduleButton()
        
    }
    
    lazy var signInLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Já tem cadastro?"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .systemGray5
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
    
    lazy var signInButton: UIButton = {
        
        let button = UIButton()
        button.setTitle("Faça login agora!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func signInButtonTapped() {
        
        delegate?.didTapSignInButton()
        
    }
    
    lazy var signUpLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Ou então..."
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .systemGray5
        return label
        
    }()
    
    lazy var signUpButton: UIButton = {
    
        let button = UIButton()
        button.setTitle("Crie seu cadastro!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemBlue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .systemGray5
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    @objc private func signUpButtonTapped() {
        
        delegate?.didTapSignUpButton()
        
    }
    
    private func setupViews() {
        
        addSubview(logoImageView)
        addSubview(welcomeLabel)
        addSubview(scheduleButton)
        addSubview(signInLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(signInButton)
        addSubview(signUpLabel)
        addSubview(signUpButton)
        
    }
    
    private func settingsLogoImageViewConstraints() {
        
        logoImageView.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(150)
            make.width.equalTo(150)
            
        }
        
    }
    
    private func settingsWelcomeLabelConstraints() {
        
        welcomeLabel.snp.makeConstraints { make in
            
            make.top.equalTo(logoImageView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            
        }
        
    }
    
    private func settingsScheduleButtonConstraints() {
        
        scheduleButton.snp.makeConstraints { make in
            
            make.top.equalTo(welcomeLabel.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(40)
            
        }
        
    }
    
    private func settingsSignInLabelConstraints() {
        
        signInLabel.snp.makeConstraints { make in
            
            make.top.equalTo(scheduleButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            
        }
        
    }
    
    private func settingsEmailTextFieldConstraints() {

        emailTextField.snp.makeConstraints { make in
            
            make.top.equalTo(signInLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(70)
            make.trailing.equalToSuperview().inset(70)
            make.height.equalTo(40)
            
        }
        
    }

    private func settingsPasswordTextFieldConstraints() {

        passwordTextField.snp.makeConstraints { make in
            
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(emailTextField)
            make.trailing.equalTo(emailTextField)
            make.height.equalTo(emailTextField)
            
        }
        
    }
    
    private func settingsSignInButtonConstraints() {
        
        signInButton.snp.makeConstraints { make in
            
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(80)
            make.trailing.equalToSuperview().inset(80)
            make.height.equalTo(scheduleButton)
            
        }
        
    }
    
    private func settingsSignUpLabelConstraints() {
        
        signUpLabel.snp.makeConstraints { make in
            
            make.top.equalTo(signInButton.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            
        }
        
    }
    
    private func settingsSignUpButtonConstraints() {
        
        signUpButton.snp.makeConstraints { make in
            
            make.top.equalTo(signUpLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(100)
            make.height.equalTo(scheduleButton)
            
        }
        
    }
    
}
