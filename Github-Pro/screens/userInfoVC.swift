//
//  userInfoVC.swift
//  Github-Pro
//
//  Created by Developer on 20/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

protocol UserInfoVCDelegate: class {
    func didTapDidHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class userInfoVC: UIViewController {
    
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    let dateLabel = GFbodyLabel(textAlignment: .center)
    var itemViews:[UIView] = []


    
    var username:String!
    weak var delegate:followerListVCDelegate!
    

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
                    self.configureUIelements(with: user)

                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Somthing went wrong", message: error.rawValue, buttonTitle: "Ok")
                
            }
            
        }
        
    }
    
    func configureUIelements(with user: User){
        
        let repoItemVC      = GFRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC  = GFFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.dateLabel.text = "Github since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    func configureViewController(){
        
        view.backgroundColor              = .systemBackground
        let doneButton                    = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    
    func layoutUI(){
        
        
        itemViews = [headerView,itemViewOne,itemViewTwo,dateLabel]
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
        
        
//        itemViewOne.backgroundColor = .blue
//        itemViewTwo.backgroundColor = .darkGray
     
     
        
        NSLayoutConstraint.activate([
        
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),
            
            
        
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 18)
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

extension userInfoVC: UserInfoVCDelegate {
    func didTapDidHubProfile(for user: User) {
        print("tapped")
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "This url attached to this user is invalid", buttonTitle: "ok")
            return
        }
        
       presentSafariVC(with: url)
        
    }
    
    func didTapGetFollowers(for user: User) {
        print(user.login)
        
        guard  user.followers != 0  else {
            presentGFAlertOnMainThread(title: "No follower", message: "This user has no follower what a Shame 😭", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}



