//
//  LogInViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 19.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    let notification = NotificationCenter.default
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
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
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = delegate
    }
    
    private lazy var emailOfPhoneField: UITextField = {
        let emailOfPhoneField = UITextField()
        setupTextField(emailOfPhoneField, placeholder: "Email or Phone")
        emailOfPhoneField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return emailOfPhoneField
    }()
    
    private lazy var passwordField: UITextField = {
        let passwordField = UITextField()
        setupTextField(passwordField, placeholder: "Password", isSecure: true, delegate: self)
        passwordField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        return passwordField
    }()
    
   private lazy var logInButton: UIButton = {
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
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        return logInButton
    }()
    
    @objc func logInButtonPressed() {
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoVK")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logInButton)
        contentView.addSubview(imageView)
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailOfPhoneField)
        stackView.addArrangedSubview(passwordField)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        constraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardDidHideNotification)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keybordSize =  (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            logInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
        ])
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.endEditing(true)
        return true
    }
}
