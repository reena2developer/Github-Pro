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
        
  
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (result) in
            
            
            switch result {
            case .success(let followers):
                
                print("followers.count  \(followers.count)")
                print(followers)
            
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message:error.rawValue, buttonTitle: "Ok")

            }
        }

    }
    

       override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
   
           navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
    

     


}
