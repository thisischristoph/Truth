//
//  JoiningViewController.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import UIKit

class JoiningViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cellColours: [UIColor] = [.red, .blue, .green, .yellow, .orange]

    @IBOutlet weak var qrCodeImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrCodeImageView.image = QRCode.generateQRCode(from: FirebaseManager.shared.currentGameReference.key)
        collectionView.register(UINib(nibName: "JoiningPlayerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "JoinPlayerCell")
        observePlayers()
    }
    
    func observePlayers() {
        FirebaseManager.shared.observePlayers {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FirebaseManager.shared.gamePlayers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: JoiningPlayerCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "JoinPlayerCell", for: indexPath) as! JoiningPlayerCollectionViewCell
        let player = FirebaseManager.shared.gamePlayers[indexPath.row]
        cell.view.backgroundColor = cellColours[indexPath.row % cellColours.count]
        cell.playerImageView.kingfisherImageFromURLString(urlString: player.profileURLString)
        cell.playerNameLabel.text = player.name
        
        return cell
    }

}
