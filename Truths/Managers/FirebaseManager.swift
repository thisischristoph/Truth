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
    
    func createNewGame(completion: @escaping () -> Void) {
        currentGameReference = Database.database().reference().child("Games").childByAutoId()
        completion()
    }
    
    func addCurrentUserToGame() {
       let player = PlayerManager.shared.currentUser
        currentGameReference.child("Players").child(PlayerManager.shared.currentUser.uid).updateChildValues(["name":player?.name ?? "",
                                                                                                             "uid":player?.uid ?? "",
                                                                                                             "profileURL":player?.profileURLString ?? ""])
    }
    
//    func observeQuestions(completion: @escaping () -> Void){
//        GameManager.shared.currentGameReference.child(gameKeys.questions.rawValue).observe(.value, with: { snapshot in
//            var updatedQuestions: [Question] = []
//            for item in snapshot.children {
//                let question = Question(snapshot: item as! DataSnapshot)
//                updatedQuestions.append(question)
//            }
//            QuestionManager.shared.questions = updatedQuestions
//            completion()
//        })
//    }
    
    func observePlayers(completion: @escaping () -> Void) {
        FirebaseManager.shared.currentGameReference.child("Players").observe(.value, with: { snapshot in
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
