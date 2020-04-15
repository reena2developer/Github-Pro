//
//  FollowersListVC.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit



class FollowersListVC: UIViewController {
    var username:String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        print(username ?? "")
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    

  

}
