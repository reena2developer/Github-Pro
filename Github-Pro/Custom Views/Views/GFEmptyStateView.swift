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
        
     configureLogoImageView()
     configureMessagelabel()
        
    }
    
    private func configureMessagelabel(){
        addSubview(messageLabel)
        messageLabel.numberOfLines = 3
        messageLabel.textColor     =  .secondaryLabel
        
        // condition  for checking the constraint for device like iphoneSE
              let labelCenterYConstant:CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
              let messaageLabelCenterYConstraint =  messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
              
              messaageLabelCenterYConstraint.isActive = true
        
        NSLayoutConstraint.activate([
           
               messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
               messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
               messageLabel.heightAnchor.constraint(equalToConstant: 200),
           ])
              
        
    }
    
    
    private func configureLogoImageView(){
        addSubview(logoImageVIew)
        logoImageVIew.image  =  Images.emptyStateLogo
        logoImageVIew.translatesAutoresizingMaskIntoConstraints = false
        
        // condition  for checking the constraint for device like iphoneSE
           let logoBottomConstant:CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
           
           let logoImageViewBottomConstraint =   logoImageVIew.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
           
           logoImageViewBottomConstraint.isActive = true
        
        
        NSLayoutConstraint.activate([

            logoImageVIew.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageVIew.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
            logoImageVIew.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
           
            
        
        ])
        
    }
}
