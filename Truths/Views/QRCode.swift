//
//  QRCode.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import UIKit

class QRCode {
    
    
    class func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }
}
