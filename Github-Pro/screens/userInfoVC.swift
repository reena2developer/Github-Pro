//
//  userInfoVC.swift
//  Github-Pro
//
//  Created by Developer on 20/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class userInfoVC: UIViewController {
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    var itemViews:[UIView] = []

    
    var username:String!
    

    override func viewDidLoad() {
        super.viewDidLoad()

      
       print(username!)
       layoutUI()
       configureViewController()
       getUserInfo()

        
        
        
    }
    
    
    func getUserInfo(){
        
        NetworkManager.shared.getUserInfo(for: username!) {[weak self] result in
            
            guard let self = self else {return}
            
            switch result {
            case .success(let user):
                print(user)
                DispatchQueue.main.async {
                self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)

                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong`", message: error.rawValue, buttonTitle: "Ok")
                
            }
            
        }
        
    }
    
    func configureViewController(){
        
        view.backgroundColor              = .systemBackground
        let doneButton                    = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    
    func layoutUI(){
        
        
        itemViews = [headerView,itemViewOne,itemViewTwo]
        let padding:CGFloat = 20
        let itemHeight: CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
            
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        
        itemViewOne.backgroundColor = .blue
        itemViewTwo.backgroundColor = .darkGray
     
     
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            
        
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    func add(childVC:UIViewController, to containerView:UIView){
        
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
   @objc func dismissVC(){
        
        dismiss(animated: true)
    }
    



}
