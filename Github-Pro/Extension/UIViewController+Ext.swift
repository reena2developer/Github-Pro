//
//  UIViewController+Ext.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title:String,message:String,buttonTitle:String) {
        
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            
            self.present(alertVC, animated: true)
            
        }
    }
}
