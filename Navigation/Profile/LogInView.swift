//
//  logInView.swift
//  Navigation
//
//  Created by Mac ыыы on 19.02.2023.
//

import UIKit

final class LogInView: UIView {

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
    
     let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func setupTextField(_ textField: UITextField, placeholder: String, isSecure: Bool = false, delegate: UITextFieldDelegate? = nil) {
        textField.backgroundColor = .systemGray6
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.placeholder = placeholder
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(red: 0.2, green: 0.7, blue: 0.9, alpha: 1.0)
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = isSecure
        textField.returnKeyType = .next
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = delegate
    }

    private lazy var emailOfPhoneField: UITextField = {
        let emailOfPhoneField = UITextField()
        setupTextField(emailOfPhoneField, placeholder: "Email or Phone")
        return emailOfPhoneField
    }()

    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        setupTextField(passwordField, placeholder: "Password", isSecure: true, delegate: self)
        return passwordField
    }()
    
    let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setTitle("Log in", for: .normal)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.layer.masksToBounds = true
        logInButton.titleLabel?.font = .systemFont(ofSize: 20)
        logInButton.setTitleColor(.white, for: .normal)
        logInButton.alpha = 1
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .selected)
        logInButton.alpha = 0.8
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .highlighted)
        logInButton.alpha = 0.8
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .disabled)
        logInButton.alpha = 0.8
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoVK")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private func setupView() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logInButton)
        contentView.addSubview(emailOfPhoneField)
        contentView.addSubview(passwordField)
        contentView.addSubview(imageView)
        
    }
    
   private func constraints() {
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
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor), // Add this line
            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            emailOfPhoneField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120), // Change this line
            emailOfPhoneField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailOfPhoneField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailOfPhoneField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailOfPhoneField.bottomAnchor, constant: 0),
            passwordField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16) // Add this line
         
        ])
   }
    
}

extension LogInView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
      endEditing(true)
        return true
    }
}
