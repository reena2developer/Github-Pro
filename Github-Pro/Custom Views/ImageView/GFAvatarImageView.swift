//
//  GFAvatarImageView.swift
//  Github-Pro
//
//  Created by Developer on 16/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//


import UIKit

class GFAvatarImageView: UIImageView {
    
    let placeholderImage = Images.placeHolder
    let cache            = NetworkManager.shared.cache
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
