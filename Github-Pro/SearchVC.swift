//
//  SearchVC.swift
//  Github-Pro
//
//  Created by Developer on 14/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView     = UIImageView()
    let usernameTextField = GFTextField()
    let callActionButton  = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    
    
    func configureLogoImageView() {
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
        
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
            
        
        ])
        
    }
    
    
    func configureTextField() {
        
        view.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
        
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func configureCallToActionButton(){
        
        view.addSubview(callActionButton)
        
        NSLayoutConstraint.activate([
        
            callActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            callActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            callActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            callActionButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
        
    }


}
