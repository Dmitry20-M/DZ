//
//  LogInViewController.swift
//  Navigation
//
//  Created by Mac ыыы on 19.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    let notification = NotificationCenter.default
    let logInView = LogInView()
    
    override func loadView() {
        super.loadView()
        view = logInView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keybordSize =  (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            logInView.scrollView.contentInset.bottom = keybordSize.height
            logInView.scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide() {
        logInView.scrollView.contentInset = .zero
        logInView.scrollView.verticalScrollIndicatorInsets = .zero 
    }


}
