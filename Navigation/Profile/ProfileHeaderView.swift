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
    
    private lazy var showStatusButton: UIButton = {
        let showStatusButton = UIButton()
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.titleLabel?.font = showStatusButton.titleLabel?.font.withSize(14)
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.addTarget(self, action: #selector(buttoonAction), for: .touchUpInside)
        
        return showStatusButton
        
    }()
    
    
    @objc private func buttoonAction(_ sender: UIButton) {
        print(waitingForSomethingLabel.text ?? "")
        
        
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.layer.cornerRadius = 70
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var rockMusicNameLabel: UILabel = {
        let rockMusicNameLabel = UILabel()
        rockMusicNameLabel.text = "Rock Music"
        rockMusicNameLabel.tintColor = .black
        rockMusicNameLabel.font = UIFont.systemFont(ofSize: 18)
        rockMusicNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return rockMusicNameLabel
    }()
    
    private lazy var waitingForSomethingLabel: UILabel = {
        let waitingForSomethingLabel = UILabel()
        waitingForSomethingLabel.text = "Waiting for something"
        waitingForSomethingLabel.tintColor = .gray
        waitingForSomethingLabel.font = UIFont.systemFont(ofSize: 14)
        waitingForSomethingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return waitingForSomethingLabel
    }()
    
    
    private let listingToMusicField: UITextField = {
        let listingToMusicField = UITextField()
        listingToMusicField.borderStyle = .roundedRect
        listingToMusicField.font = UIFont.systemFont(ofSize: 18)
        listingToMusicField.placeholder = "Listing to music"
        listingToMusicField.layer.cornerRadius = 12
        listingToMusicField.clipsToBounds = true
        listingToMusicField.layer.borderWidth = 1
        listingToMusicField.layer.borderColor = UIColor.black.cgColor
        listingToMusicField.translatesAutoresizingMaskIntoConstraints = false
        return listingToMusicField
        
    }()
    
    private func setupView() {
        
        addSubview(rockMusicNameLabel)
        addSubview(waitingForSomethingLabel)
        addSubview(imageView)
        addSubview(showStatusButton)
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            imageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            
            rockMusicNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            rockMusicNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            
            
            waitingForSomethingLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            waitingForSomethingLabel.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            
            
            showStatusButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
}

