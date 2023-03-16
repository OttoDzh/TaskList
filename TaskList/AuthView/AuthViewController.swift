//
//  AuthViewController.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 08.02.2023.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {
  
  let authView = AuthView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = authView
    addTargets()
    authView.emailTf.delegate = self
    authView.passwordTf.delegate = self
  }
  
  func addTargets() {
    authView.signUpButton.addTarget(self, action: #selector(showRegVC), for: .touchUpInside)
    authView.loginButton.addTarget(self, action: #selector(signIn), for: .touchUpInside)
  }
  
  @objc func signIn() {
    AuthService.shared.signIn(email: authView.emailTf.text!,
                              passwd: authView.passwordTf.text!) { result in
      switch result {
      case .success(let user):
        print(user.email!)
        FirestoreService.shared.getUserData(userID: user.uid) { result in
          switch result {
          case .success(let user):
            let vc = TaskViewController(isFirst: false, userId: user.id)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      case .failure(_):
        let alertController = UIAlertController(title: "Error!", message: "No such user or incorrect password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ок", style: .default) {(action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true)
      }
    }
    view.endEditing(true)
  }
  
  @objc func showRegVC() {
    let vc = RegViewController()
    vc.modalPresentationStyle = .fullScreen
    self.present(vc, animated: true)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    self.view.endEditing(true)
    return true
  }
  
}





