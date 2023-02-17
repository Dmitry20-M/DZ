//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 28.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHV: ProfileHeaderView = {
        let profileHV = ProfileHeaderView()
        profileHV.backgroundColor = .systemGray
        profileHV.translatesAutoresizingMaskIntoConstraints = false
        
        return profileHV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .systemGray
        self.view.addSubview(profileHV)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            profileHV.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            profileHV.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHV.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHV.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            profileHV.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        
    }
    
    
}

