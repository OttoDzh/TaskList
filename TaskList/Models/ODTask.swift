//
//  ODTask.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import Foundation
import FirebaseFirestore

struct ODTask {
    
    
    
    var title: String
    var description: String
    var id: String
    var isReady: Bool
    var isUrgent: Bool
    var isImportant: Bool
    
    internal init(title: String, description: String, id: String, isReady: Bool, isUrgent: Bool, isImportant: Bool) {
        self.title = title
        self.description = description
        self.id = id
        self.isReady = isReady
        self.isUrgent = isUrgent
        self.isImportant = isImportant
    }
    
    init?(snap:DocumentSnapshot) {
        
        guard let data = snap.data() else {return nil}
        
        guard let id = data["id"] as? String else { return nil }
        guard let title = data["title"] as? String else { return nil }
        guard let description = data["description"] as? String else { return nil }
        guard let isReady = data["isReady"] as? Bool else { return nil }
        guard let isUrgent = data["isUrgent"] as? Bool else { return nil }
        guard let isImportant = data["isImportant"] as? Bool else { return nil }
        
        self.id = id
        self.title = title
        self.description = description
        self.isReady = isReady
        self.isUrgent = isUrgent
        self.isImportant = isImportant
        
    }
    
}
