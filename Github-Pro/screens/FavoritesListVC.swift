//
//  FavoritesListVC.swift
//  Github-Pro
//
//  Created by Developer on 14/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class FavoritesListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        PersitenceManager.retrieveFavorites { result in
            switch result {
                
            case .success(let favorites):
                print(favorites)
            case .failure(let error):
                print(error)
            }
        }
    }
    

  

}
