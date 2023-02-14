//
//  FeedViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 28.01.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
       
       private let postButton: UIButton = {
           let button = UIButton()
           button.setTitle("Показать пост", for: .normal)
           button.backgroundColor = .link
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 12
           button.layer.masksToBounds = true
           button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
           return button
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           
           title = "Лента"
           view.backgroundColor = .systemGray
           
           postButton.addTarget(self, action: #selector(postButtonTapped), for: .touchUpInside)
           
//           self.navigationController?.navigationBar.isHidden = true
           
           view.addSubview(postButton)
           
       }
       
       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           postButton.frame = CGRect(x: 100, y: 100, width: 250, height: 50)
           postButton.center = self.view.center
                  
       }
       
       @objc private func postButtonTapped(sender: UIButton) {
           let postViewController = PostViewController()
           postViewController.titlePost = post.title
           self.navigationController?.pushViewController(postViewController, animated: true)
       }
   }
       

