//
//  JoiningViewController.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import UIKit

class JoiningViewController: UIViewController {

    @IBOutlet weak var qrCodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrCodeImageView.image = QRCode.generateQRCode(from: FirebaseManager.shared.currentGameReference.key)
    }


}
