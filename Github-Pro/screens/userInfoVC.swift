//
//  userInfoVC.swift
//  Github-Pro
//
//  Created by Developer on 20/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class userInfoVC: UIViewController {
    
    var username:String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor              = .systemBackground
        let doneButton                    = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
        print(username!)
        
        NetworkManager.shared.getUserInfo(for: username!) {[weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong`", message: error.rawValue, buttonTitle: "Ok")
                
            }
            
        }
        
    }
    
   @objc func dismissVC(){
        
        dismiss(animated: true)
    }
    



}
