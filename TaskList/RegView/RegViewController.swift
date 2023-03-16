//
//  RegViewController.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 09.02.2023.
//

import UIKit

class RegViewController: UIViewController {
    
  let regView = RegView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = regView
        addTargets()
    }
    
    func addTargets() {
        regView.signInButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        regView.regButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
 
    @objc func signUp() {
        AuthService.shared.signUp(email: regView.emailTf.text!,
                                  passwd: regView.passwordTf.text!) { result in
            switch result {
            case .success(_):
                self.dismiss(animated: true)
            case .failure(let error):
                print(error.localizedDescription)
                let alertController = UIAlertController(title: "Error!", message: "The password must be 6 characters long or email address is badly formatted", preferredStyle: .alert)
                let action = UIAlertAction(title: "Ок", style: .default) {(action) in
                }
                alertController.addAction(action)
                self.present(alertController, animated: true)
            }
        }
    }
  @objc func dismissSelf() {
        dismiss(animated: true)
    }
}
