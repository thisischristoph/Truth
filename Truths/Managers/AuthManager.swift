//
//  AuthManager.swift
//  Vote
//
//  Created by Christopher Harrison on 31/03/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import UIKit

class AuthManager {
    static let shared = AuthManager()
    
    func logout(from view: UIViewController) {
        do {
            if let providerData = Auth.auth().currentUser?.providerData {
                let userInfo = providerData[0]
                
                switch userInfo.providerID {
                case "google.com":
                    GIDSignIn.sharedInstance().signOut()
                    
                default:
                    break
                }
            }
            
            try Auth.auth().signOut()
            
        } catch {
            let alertController = UIAlertController(title: "Logout Error", message: error.localizedDescription, preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(okayAction)
            view.present(alertController, animated: true, completion: nil)
            
            return
        }
        
        // Present the welcome view
        if let viewController = view.storyboard?.instantiateViewController(withIdentifier: "LoginView") {
            UIApplication.shared.keyWindow?.rootViewController = viewController
            view.dismiss(animated: true, completion: nil)
        }
        
    }
}
