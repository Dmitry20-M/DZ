//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Mac ыыы on 03.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let authorText: UILabel = {
        let authorText = UILabel()
        authorText.translatesAutoresizingMaskIntoConstraints = false
        authorText.backgroundColor = .white
        authorText.font = UIFont.boldSystemFont(ofSize: 20)
        authorText.textColor = .black
        authorText.numberOfLines = 2
        return authorText
    }()
    
    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.backgroundColor = .black
        postImage.contentMode = .scaleAspectFit
        return postImage
        
    }()
    
    private let discriptionText: UILabel = {
        let discriptionText = UILabel()
        discriptionText.translatesAutoresizingMaskIntoConstraints = false
        discriptionText.backgroundColor = .white
        discriptionText.font = .systemFont(ofSize: 14)
        discriptionText.textColor = .systemGray
        discriptionText.numberOfLines = 0
        return discriptionText
    }()
    
    
    private let viewsText: UILabel = {
        let viewsText = UILabel()
        viewsText.translatesAutoresizingMaskIntoConstraints = false
        viewsText.backgroundColor = .white
        viewsText.font = .systemFont(ofSize: 16)
        viewsText.textColor = .black
        return viewsText
    }()
    
    
    private let likeText: UILabel = {
        let likeText = UILabel()
        likeText.translatesAutoresizingMaskIntoConstraints = false
        likeText.backgroundColor = .white
        likeText.font = .systemFont(ofSize: 16)
        likeText.textColor = .black
        return likeText
    }()
    

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        loyut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorText.text = ""
        discriptionText.text = ""
        postImage.image = nil
        likeText.text = ""
        viewsText.text = ""
    }
    
    func setupCell(model: PostModal) {
        authorText.text = model.author
        discriptionText.text = model.description
        postImage.image = model.postimage
        likeText.text = "Like: \(model.like)"
        viewsText.text = "Views: \(model.views)"
    }
    

    
    private func loyut() {
        let size = UIScreen.main.bounds.size.width
        [authorText, postImage, discriptionText, likeText, viewsText].forEach {
            contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
    
                
            postImage.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: 16),
            postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImage.heightAnchor.constraint(equalToConstant: size),
                    
      
            discriptionText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            discriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            discriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            
            likeText.topAnchor.constraint(equalTo: discriptionText.bottomAnchor, constant: 16),
            likeText.leadingAnchor.constraint(equalTo: discriptionText.leadingAnchor),
            
            
            viewsText.topAnchor.constraint(equalTo: discriptionText.bottomAnchor, constant: 16),
            viewsText.trailingAnchor.constraint(equalTo: discriptionText.trailingAnchor),
            viewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
    
        ])
    }
}
