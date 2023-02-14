//
//  TabBarVC.swift
//  Navigation
//
//  Created by Mac ыыы on 07.02.2023.
//

import UIKit

class TabBar: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        
    }
    
    func setupControllers() {
        let feedVC = createController(viewController: FeedViewController(), itemName: "Лента", ItemImage: "doc.richtext")
        let profileVC = createController(viewController: ProfileViewController(), itemName: "Профиль", ItemImage: "person.circle")
        viewControllers = [feedVC, profileVC]

    }
    
    func createController(viewController: UIViewController, itemName: String, ItemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: ItemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0))  ,tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = item
        return navigationController
    }
}
