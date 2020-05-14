//
//  UIView+Ext.swift
//  Github-Pro
//
//  Created by Developer on 14/05/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

extension UIView{
    
    func addSubviews(_ views:UIView...){
        
        for view in  views{addSubview(view)}
    }
}

