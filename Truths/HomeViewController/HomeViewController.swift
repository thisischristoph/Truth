//
//  HomeViewController.swift
//  Truths
//
//  Created by Christopher Harrison on 08/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        PlayerManager.shared.setInitialCurrentUser()
        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        
    }
    
    @IBAction func startGame(_ sender: Any) {
        FirebaseManager.shared.createNewGame {
            FirebaseManager.shared.addCurrentUserToGame()
        }
        self.performSegue(withIdentifier: "startSegue", sender: nil)
    }
    
    @IBAction func joinGame(_ sender: Any) {
        self.performSegue(withIdentifier: "scanSegue", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
    
    
    

}
