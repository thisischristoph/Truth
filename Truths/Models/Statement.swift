//
//  Statement.swift
//  Truths
//
//  Created by Christopher Harrison on 08/04/2018.
//  Copyright © 2018 Christopher Harrison. All rights reserved.
//

import Foundation
import Firebase

enum StatementType: String {
    case truth = "truth"
    case lie = "lie"
}

struct Statement {
    let key: String
    let ref: DatabaseReference?
    let text: String
    let type: StatementType
    
    init(
        key: String = "",
        name: String,
        text: String,
        type: StatementType
        ) {
        self.key = key
        self.ref = nil
        self.text = text
        self.type = type
    }
    
    init(snapshot: DataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        text = snapshotValue["text"] as? String ?? ""
        type = snapshotValue["statementType"] as? StatementType ?? StatementType.truth
        ref = snapshot.ref
    }
}
