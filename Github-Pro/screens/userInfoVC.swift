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
        print(username)
        
    }
    
   @objc func dismissVC(){
        
        dismiss(animated: true)
    }
    



}
