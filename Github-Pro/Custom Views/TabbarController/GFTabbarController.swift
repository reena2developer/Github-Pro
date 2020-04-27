//
//  GFTabbarController.swift
//  Github-Pro
//
//  Created by Developer on 27/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class GFTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavroitesNavigationController()]


        // Do any additional setup after loading the view.
    }
    

    func createSearchNavigationController() -> UINavigationController {
           
           let searchVC = SearchVC()
           searchVC.title = "Search"
           searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
           return UINavigationController(rootViewController: searchVC)
       }
       
       
       func createFavroitesNavigationController() -> UINavigationController{
           
           let favroitesVC = FavoritesListVC()
           favroitesVC.title = "Favroites"
           favroitesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
           return UINavigationController(rootViewController: favroitesVC)
           
       }
       

}
