//
//  DetailTaskViewController.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 12.02.2023.
//

import UIKit

protocol DataDelegate {
    func updateAfterEditing()
}

class DetailTaskViewController: UIViewController {
    let detailtaskView = DetailTaskView()
    var task: ODTask
    var userID: String
    var tasks = [ODTask]()
    var delegater : DataDelegate?

    init(task: ODTask,userId:String) {
        self.task = task
        self.userID = userId
        super.init(nibName: nil, bundle: nil)
    }
  
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailtaskView
        updateView()
        addTargets()
        getUserData()
        getTasks()
    }

    func addTargets() {
        detailtaskView.editButton.addTarget(self, action: #selector(editButtonPushed), for: .touchUpInside)
        detailtaskView.doneButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        detailtaskView.deleteButton.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
    }

    @objc func dismissSelf() {
        self.delegater?.updateAfterEditing()
        self.dismiss(animated: true)
    }

    func getUserData() {
        FirestoreService.shared.getUserData(userID: userID) { result in
            switch result {
            case .success(let user):
                self.userID = user.id
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func getTasks() {
        FirestoreService.shared.getTasks(userID: userID) { result in
            switch result {
            case .success(let tasks):
                self.tasks = tasks
            case .failure(_):
                print("error")
            }
        }
    }
    
    @objc func deleteTask() {
        FirestoreService.shared.deleteTask(userId: userID, id: task.id) { result in
            switch result {
            case .success(let id):
                print("Task \(id) deleted")
                self.dismissSelf()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    @objc func editButtonPushed() {
        let vc = CreateTaskViewController(task: task)
        vc.delegatee = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func updateView() {
        detailtaskView.taskNameLabel.text = task.title
        detailtaskView.desciptText.text = task.description
        detailtaskView.importantLabel.text = createCategoryLabelText()
    }
    
    func createCategoryLabelText() -> String {
        var result = ""
      
        switch task.isImportant {
        case true:
            result += "Important! "
        case false:
            result += "Not Important! "
        }
        switch task.isUrgent {
        case true:
            result += "Urgent!"
        case false:
            result += "Not urgent!"
        }
        return result
    }
}

extension DetailTaskViewController: UpdateViewDelegate {
    func updateViews(taskName: String,taskDescript:String,isImportant:Bool,isUrgent:Bool) {
        self.detailtaskView.taskNameLabel.text = taskName
        self.detailtaskView.desciptText.text = taskDescript
        func createCategoryInsideLabelText() -> String {
            var result = ""
            
            switch isImportant {
            case true:
                result += "Important! "
            case false:
                result += "Not Important! "
            }
            switch isUrgent {
            case true:
                result += "Urgent!"
            case false:
                result += "Not urgent!"
            }
            return result
        }
        self.detailtaskView.importantLabel.text = createCategoryInsideLabelText()
        getTasks()
    }
}







    
    
    



    

