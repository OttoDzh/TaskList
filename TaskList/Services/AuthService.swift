//
//  AuthService.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 09.02.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    var auth = Auth.auth()
    static let shared = AuthService()
    
    var currentUser : User? {
        return auth.currentUser
    }
    
    func signIn(email:String,passwd:String, completion: @escaping (Result<User,Error>) -> Void) {
        auth.signIn(withEmail: email, password: passwd) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func signUp(email:String,passwd:String,completion : @escaping (Result<ODUser,Error>)-> Void) {
        auth.createUser(withEmail: email,
                        password: passwd) { result, error in
            if let result = result {
                
                FirestoreService.shared.saveProfile(id: result.user.uid,
                                                    eMail: email) { result in
                    switch result {
                        
                    case .success(let user):
                        completion(.success(user))
                    case .failure(let error):
                        print(error.localizedDescription)
                        print("Oshibka zapisi v bazu")
                    }
                }
                
                
            } else if let error = error {
                completion(.failure(error))
                print("oshibka registracii")
            }
        }
        
    }
    
    func signOut() {
        if let _ = auth.currentUser {
            try! auth.signOut()
        }
       
    }
}
