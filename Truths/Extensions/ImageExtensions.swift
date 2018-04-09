//
//  ImageExtensions.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    public func setLoadingImage() {
        self.kf.indicatorType = .activity
    }
    
    public func kingfisherImageFromURLString(urlString: String) {
        let url = NSURL(string: urlString)! as URL
        self.kf.setImage(with: url)
    }
    
    public func kingfisherImageFromURL(url: URL) {
        self.kf.setImage(with: url)
    }
}
