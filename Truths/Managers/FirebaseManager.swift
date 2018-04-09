//
//  FirebaseManager.swift
//  Truths
//
//  Created by Christopher Harrison on 09/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    var currentGameReference: DatabaseReference!
    
    func createNewGame(completion: @escaping () -> Void) {
        currentGameReference = Database.database().reference().child("Games").childByAutoId()
        completion()
    }
    
    func addCurrentUserToGame() {
       let player = PlayerManager.shared.currentUser
        currentGameReference.child("players").child(PlayerManager.shared.currentUser.uid).updateChildValues(["name":player?.name ?? "",
                                                                                                             "uid":player?.uid ?? "",
                                                                                                             "profileURL":player?.profileURLString ?? ""])
    }
}
