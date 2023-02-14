//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 28.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHV = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .systemGray
        self.view.addSubview(profileHV)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHV.frame = self.view.frame
        
    }

    
}

