//
//  StatementSet.swift
//  Truths
//
//  Created by Christopher Harrison on 08/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import Firebase

struct StatementSet {
    let key: String
    let ref: DatabaseReference?
    var statements: [Statement] = []
    var played: Bool = false
    
    init(
        key: String = "",
        name: String,
        played: Bool,
        statements: [Statement] = []
        ) {
        self.key = key
        self.ref = nil
        self.played = played
        self.statements = statements
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        played = snapshotValue["played"] as? Bool ?? false
        statements = snapshotValue["statements"] as! [Statement]
        
        ref = snapshot.ref
    }
}
