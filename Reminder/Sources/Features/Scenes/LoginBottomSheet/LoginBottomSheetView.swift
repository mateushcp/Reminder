//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 13/07/24.
//

import Foundation
import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.subHeading
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.login.label.title".localized
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.passwordText.label.title".localized
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.tittle".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(loginButtonDidTapeed), for: .touchUpInside)
        button.titleLabel?.font = Typography.subHeading
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(passwordTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant:  Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        
        ])
    }
    
    @objc
    private func loginButtonDidTapeed() {
        let password = passwordTextField.text ?? ""
        let user = emailTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
    
}