//
//  GFItemInfoView.swift
//  Github-Pro
//
//  Created by Developer on 23/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

enum itemInfoType {
    case repos,gists,followers,following
}


class GFItemInfoView: UIView {

    let symbolsImageView = UIImageView()
    let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func configure(){
        
        addSubview(symbolsImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolsImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolsImageView.contentMode = .scaleAspectFill
        symbolsImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
        
            symbolsImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolsImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolsImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolsImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolsImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolsImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 10)
            
            
            
            
        ])
    }
    
    func set(itemInfoType :itemInfoType, withCount count:Int){
        
        switch itemInfoType {
        case .repos:
            symbolsImageView.image =   SFSymbols.repos
            titleLabel.text = "Public Repos"
        case .gists:
            symbolsImageView.image =  SFSymbols.gists

            titleLabel.text = "Public Gists"

        case .followers:
            symbolsImageView.image =  SFSymbols.followers
            titleLabel.text = "Followers"


        case .following:
            symbolsImageView.image =  SFSymbols.following
            titleLabel.text = "Following"


        }
        countLabel.text = String(count)

    }
}
