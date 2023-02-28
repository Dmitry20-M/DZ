//
//  FeedViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 28.01.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
       
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
   
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("button", for: .normal)
        button.backgroundColor = .blue
        
        return button
    }()
    
    @objc func buttonPressed(_ sender: UIButton) {
        let post = PostViewController()
        self.navigationController?.pushViewController(post, animated: true)

    }
    
    private  let buttonTwo: UIButton = {
        let buttonTwo = UIButton()
        buttonTwo.setTitle("buttonTwo", for: .normal)
        buttonTwo.backgroundColor = .red
        
        return buttonTwo
    }()
    
    @objc func buttonPressedTwo(_ sender: UIButton) {
        let post = PostViewController()
        self.navigationController?.pushViewController(post, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Лента"
        view.backgroundColor = .systemGray
        view.addSubview(stackView)
        setupConstraints()
        
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(buttonTwo)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        buttonTwo.addTarget(self, action: #selector(buttonPressedTwo), for: .touchUpInside)
        
    }
       
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
}
       

