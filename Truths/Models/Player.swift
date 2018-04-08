//
//  Player.swift
//  Truths
//
//  Created by Christopher Harrison on 08/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import Firebase

struct Player {
    let key: String
    var name: String
    let uid: String
    let profileURLString: String
    var statementSets: [StatementSet] = []
    let ref: DatabaseReference?
    
    init(
        key: String = "",
        name: String,
        uid: String,
        profileURLString: String = "",
        statementSets: [StatementSet] = []
        ) {
        self.key = key
        self.name = name
        self.uid = uid
        self.profileURLString = profileURLString
        self.statementSets = statementSets
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        uid = snapshotValue["uid"] as! String
        profileURLString = snapshotValue["profileURL"] as? String ?? ""
        statementSets = snapshotValue["statementSets"] as? [StatementSet] ?? []
        ref = snapshot.ref
    }
}
