//
//  GFRepoItemVC.swift
//  Github-Pro
//
//  Created by Developer on 23/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItem()
        
        
    }
    
    private func configureItem(){
        
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
   
    override func actionButtonTapped() {
        delegate.didTapDidHubProfile(for: user)
    }
    
}
