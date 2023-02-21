//
//  FirestoreService.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreService {
    
    static let shared = FirestoreService()
    private let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    // MARK: Save task
    
    func saveTask(id:String?,
                  title:String,
                  descipt: String,
                  isUrgent:Bool,
                  isImportant:Bool,
                  completion:@escaping (Result<String,Error>)->Void) {
        
        var taskId: String
        
        if id == nil {
            taskId = UUID().uuidString
        } else {
            taskId = id!
        }
        
     
        

        
        let userRef = usersRef.document(Auth.auth().currentUser!.uid)
        let tasksRef = userRef.collection("tasks")
        tasksRef.document(taskId).setData(["id":taskId,
                                       "title":title,
                                       "description":descipt,
                                       "isUrgent":isUrgent,
                                       "isImportant":isImportant,
                                       "isReady":false]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success("Ok"))
            }
        }
    }
    
    func deleteTask(userId:String, id:String, completion: @escaping(Result<String,Error>) -> Void) {
        
        let docRef = usersRef.document(userId).collection("tasks").document(id)
        docRef.delete {  error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(id))
            }
        }
        
    }
    
    func getTasks(userID:String,completion: @escaping(Result<[ODTask],Error>) -> Void) {
        let tasksRef = usersRef.document(userID).collection("tasks")
        var tasks = [ODTask]()
        tasksRef.getDocuments { querySnapshot, error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            } else {
                for doc in  querySnapshot!.documents {
                    guard let task = ODTask(snap: doc) else {
                        return
                    }
                    tasks.append(task)
                }
                completion(.success(tasks))
            }
        }
    }
    
    func getUserData(userID:String,completion: @escaping(Result<ODUser,Error>) -> Void) {
        let userRef = usersRef.document(userID)
        userRef.getDocument { docSnap, error in
            if let docSnap = docSnap {
                
                guard let odUser = ODUser(snap: docSnap) else {
                    completion(.failure(error!))
                    return
                }
                completion(.success(odUser))
            } else if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    //MARK: Save profile
    
    func saveProfile(id:String,
                     eMail:String, completion: @escaping (Result<ODUser,Error>) -> Void) {
        let user = ODUser(id: id,
                          eMail: eMail)
        
        usersRef.document(user.id).setData(["id":id,
                                            "eMail":eMail]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
            
        }
        
    }
}
