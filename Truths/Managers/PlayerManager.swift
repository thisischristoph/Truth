//
//  PlayerManager.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import FirebaseAuth

class PlayerManager {
    
    static let shared = PlayerManager()
    
    var currentUser: Player!
    
    func setInitialCurrentUser() {
        currentUser = Player(key: Auth.auth().currentUser?.uid ?? "",
                             name: Auth.auth().currentUser?.displayName ?? "",
                             uid: Auth.auth().currentUser?.uid ?? "",
                             profileURLString: Auth.auth().currentUser?.photoURL?.absoluteString ?? "",
                             statementSets: [])
    }
}
