//
//  BorderedCollectionView.swift
//  Truths
//
//  Created by Christopher Harrison on 11/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class BorderedCollectionView: UICollectionView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }

    }

}
