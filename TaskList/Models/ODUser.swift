//
//  ODUser.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import Foundation
import FirebaseFirestore

struct ODUser {
    
    let id: String
    let eMail: String
 
    init?(snap:DocumentSnapshot) {
        guard let data = snap.data() else {return nil}
        guard let id = data["id"] as? String else { return nil }
        guard let eMail = data["eMail"] as? String else { return nil }
        self.id = id
        self.eMail = eMail
    }
    
    init(id: String,eMail: String) {
        self.id = id
        self.eMail = eMail
    }
}
