//
//  Game.swift
//  Truths
//
//  Created by Christopher Harrison on 08/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import Firebase

struct Game{
    
    var key: String
    var name: String
    var players: [Player]
    let ref: DatabaseReference?
    
    init(
        key: String = "",
        name: String,
        players: [Player] = []
        ) {
        self.key = key
        self.name = name
        self.players = players
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as? String ?? ""
        players = snapshotValue["players"] as? [Player] ?? []
        ref = snapshot.ref
    }
    
}
