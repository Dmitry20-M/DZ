//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 28.01.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let postModal = PostModal.myPostModel()

       private lazy var tableView: UITableView = {
           let tableView = UITableView(frame: .zero, style: .grouped)
           tableView.dataSource = self
           tableView.delegate = self
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
           return tableView
       }()
       
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           navigationController?.navigationBar.isHidden = true
           constraints()
       }
       
       private func constraints() {
           view.addSubview(tableView)
           
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
           ])
       }
       
   }

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModal.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.setupCell(model: postModal[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileHederView()
        header.backgroundColor = .systemGray4
        return header
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension

    }
}


