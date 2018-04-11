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
    var gamePlayers: [Player] = []
    
    func setCurrentGameReference(to id: String) {
        currentGameReference = Database.database().reference(withPath: "games").child(id)
    }
    
    func createNewGame(completion: @escaping () -> Void) {
        currentGameReference = Database.database().reference().child("games").childByAutoId()
        completion()
    }
    
    func addCurrentUserToGame() {
       let player = PlayerManager.shared.currentUser
        currentGameReference.child("players").child(PlayerManager.shared.currentUser.uid).updateChildValues(["name":player?.name ?? "",
                                                                                                             "uid":player?.uid ?? "",
                                                                                                             "profileURL":player?.profileURLString ?? ""])
    }
    
    func observePlayers(completion: @escaping () -> Void) {
        FirebaseManager.shared.currentGameReference.child("players").observe(.value, with: { snapshot in
            var updatedPlayers: [Player] = []
            for item in snapshot.children {
                let player = Player(snapshot: item as! DataSnapshot)
                updatedPlayers.append(player)
            }
            self.gamePlayers = updatedPlayers
            completion()
        })
    }
}
