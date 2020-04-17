//
//  FollowersListVC.swift
//  Github-Pro
//
//  Created by Developer on 15/04/2020.
//  Copyright © 2020 Developer. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    
    enum Section {case main}
    
    var followers:[Follower] = []
    var page = 1
    var hasMoreFollower = true
    
    
    var username:String!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section,Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureCollectionView()
        getFollowers(username: username, page: page)
        configureDataSource()

    }
    
       override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
   
           navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func configureViewController(){
        
        navigationController?.navigationBar.prefersLargeTitles = true
         view.backgroundColor = .systemBackground

    }

     func configureCollectionView(){
        
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColoumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
    }
    
 
    
    func getFollowers(username:String,page:Int){
        
        
        // loading indicator start
        
        showLoadingView()
        // very imporant  for the memory leak we need to make the self as a weak veriable but anything that is weak its going  to be optional , [weak self called the capture list]
        
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] (result) in
                        
            guard let self = self else {return}
            self.dismissLoadingView()

            switch result {
            case .success(let followers):
                if followers.count < 100 {self.hasMoreFollower = false}
                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message:error.rawValue, buttonTitle: "Ok")

            }
        }
    }
    
    func configureDataSource(){
        
        dataSource = UICollectionViewDiffableDataSource<Section,Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
             
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPath) as! FollowerCell
            
            cell.set(follower: follower)
            
            return cell
        })
    }

        func updateData(){
        var snapShop = NSDiffableDataSourceSnapshot<Section,Follower>()
        snapShop.appendSections([.main])   // know about the sections
        snapShop.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapShop, animatingDifferences: true)}
    }
}


extension FollowersListVC: UICollectionViewDelegate{
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offSetY = scrollView.contentOffset.y  // provide the numbers in points like how far we scroll
        let contentHeight = scrollView.contentSize.height // total height of the scroll view
        let height = scrollView.frame.size.height  // height of the  scroll view in a device
        
        
        if offSetY > contentHeight - height {
            guard hasMoreFollower else {return}
            page += 1

            getFollowers(username: username, page: page)
        }

        
        
        
    }
}
