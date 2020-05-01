//
//  GFEmptyStateView.swift
//  Github-Pro
//
//  Created by Developer on 18/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageVIew = UIImageView()
    
    

    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(message: String){
        
        self.init(frame:.zero)
        messageLabel.text = message
    }
    
    private func configure(){
        
        addSubview(messageLabel)
        addSubview(logoImageVIew)
        
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor     =  .secondaryLabel
        logoImageVIew.image  =  #imageLiteral(resourceName: "empty-state-logo")
        logoImageVIew.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200),
            
            
            logoImageVIew.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageVIew.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
            logoImageVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
            
        
        ])
        
    }
}
