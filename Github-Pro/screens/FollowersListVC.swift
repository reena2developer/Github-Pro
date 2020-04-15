//
//  FollowersListVC.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit



class FollowersListVC: UIViewController {
    var username:String!


    override func viewDidLoad() {
        super.viewDidLoad()
        
       navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("followers.count  \(followers.count)")
            print(followers)
        }

    }
    

       override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
   
           navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
    

     


}
