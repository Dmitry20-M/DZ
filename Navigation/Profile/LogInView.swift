//
//  logInView.swift
//  Navigation
//
//  Created by Mac ыыы on 19.02.2023.
//

import UIKit

class LogInView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
     let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var  emailOfPhoneField: UITextField = {
        let emailOfPhoneField = UITextField()
        emailOfPhoneField.backgroundColor = .systemGray6
        emailOfPhoneField.autocapitalizationType = .none
        emailOfPhoneField.layer.cornerRadius = 10
        emailOfPhoneField.layer.borderWidth = 0.5
        emailOfPhoneField.layer.borderColor = UIColor.lightGray.cgColor
        emailOfPhoneField.placeholder = "Email of phone"
        emailOfPhoneField.backgroundColor = .systemGray6
        emailOfPhoneField.textColor = .black
        emailOfPhoneField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailOfPhoneField.tintColor = UIColor(named: "ColorSet")
        emailOfPhoneField.autocapitalizationType = .none
        emailOfPhoneField.translatesAutoresizingMaskIntoConstraints = false
        return emailOfPhoneField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        passwordField.backgroundColor = .systemGray6
        passwordField.layer.cornerRadius = 10
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = UIColor.lightGray.cgColor
        passwordField.placeholder = "Password"
        passwordField.backgroundColor = .systemGray6
        passwordField.textColor = .black
        passwordField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordField.tintColor = UIColor(named: "ColorSet")
        passwordField.autocapitalizationType = .none
        passwordField.isSecureTextEntry = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.delegate = self
        return passwordField
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setTitle("Log in", for: .normal)
        logInButton.backgroundColor = UIColor(named: "ColorSet")
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 12
        logInButton.layer.masksToBounds = true
        logInButton.titleLabel?.font = .systemFont(ofSize: 20)
        logInButton.alpha = 1
        logInButton.isEnabled = false
        logInButton.alpha = 0.8
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return logInButton
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoVK")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    @objc func logInButtonPressed() {
//        let profileVC = ProfileViewController()
//        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
//        contentView.addSubview(logInButton)
//        contentView.addSubview(emailOfPhoneField)
//        contentView.addSubview(passwordField)
//        contentView.addSubview(imageView)
        
        scrollView.addSubview(logInButton)
        scrollView.addSubview(emailOfPhoneField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(imageView)
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            emailOfPhoneField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            emailOfPhoneField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            emailOfPhoneField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailOfPhoneField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailOfPhoneField.bottomAnchor, constant: 0),
            passwordField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }

}


extension LogInView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      endEditing(true)

        return true
    }
}
