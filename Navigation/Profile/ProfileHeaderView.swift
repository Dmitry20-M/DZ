//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Mac ыыы on 29.01.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private let avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "logo")
        avatarImageView.layer.cornerRadius = 70
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.clipsToBounds = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return avatarImageView
    }()
    
    private lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.text = "Rock Music"
        fullNameLabel.tintColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return fullNameLabel
    }()
    
    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.text = "Listing to music"
        statusLabel.tintColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 15)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        return statusLabel
    }()
    
    private var statusText: String?
    
    
    private let statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.borderStyle = .roundedRect
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.placeholder = "Listing to music"
        statusTextField.layer.cornerRadius = 12
        statusTextField.clipsToBounds = true
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.layer.borderColor = UIColor.white.cgColor
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return statusTextField
        
    }()
    
    private lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.titleLabel?.font = setStatusButton.titleLabel?.font.withSize(14)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return setStatusButton
        
    }()
    
    private lazy var newButton: UIButton = {
        let newButton = UIButton()
        newButton.backgroundColor = .systemBlue
        newButton.setTitle("button one", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.titleLabel?.font = newButton.titleLabel?.font.withSize(14)
        newButton.layer.cornerRadius = 4
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
        return newButton
        
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        print(statusText ?? "")
        
    }
    
    private func setupView() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(statusTextField)
        addSubview(newButton)
        
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 150),
            avatarImageView.heightAnchor.constraint(equalToConstant: 150),
            
            
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -10),
            
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -34),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
      
            newButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            newButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 35)
           
            
        ])
        
    }

    
}

