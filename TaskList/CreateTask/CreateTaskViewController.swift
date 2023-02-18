//
//  CreateTaskViewController.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 11.02.2023.
//

import UIKit

protocol AddTaskDelegate {
    func reloadIUI()
}

protocol UpdateViewDelegate {
    func updateViews(taskName:String,taskDescript:String,isImportant:Bool,isUrgent:Bool)
}


class CreateTaskViewController: UIViewController,UITextFieldDelegate {
    let createTaskView = CreateTaskView()
    var delegate: AddTaskDelegate?
    var delegatee: UpdateViewDelegate?
    
    
    
    var task: ODTask?
    
    init(task:ODTask?){
        self.task = task
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = createTaskView
        addTargets()
        updateViews()
        createTaskView.taskNameTf.delegate = self
        createTaskView.taskDecsriptTf.delegate = self
    }
    
    func updateViews() {
        guard let task = self.task  else {
            return
        }
        createTaskView.addTaskLabel.text = "Edit Task"
        createTaskView.taskNameTf.text = task.title
        createTaskView.taskDecsriptTf.text = task.description
        
        switch task.isUrgent {
            
        case true:
            createTaskView.isUrgent.isOn = true
        case false:
            createTaskView.isUrgent.isOn = false
        }
        
        switch task.isImportant {
            
        case true:
            createTaskView.isImportant.isOn = true
        case false:
            createTaskView.isImportant.isOn = false
        }
    }
    
    
    func addTargets() {
        createTaskView.saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        createTaskView.cancelButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
    }

    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
    
    @objc func saveTask() {
        
        let title = createTaskView.taskNameTf.text!
        let desciprtion = createTaskView.taskDecsriptTf.text!
        let isUrgent = createTaskView.isUrgent.isOn
        let isImportant = createTaskView.isImportant.isOn
        
        var id: String? = nil
        
        if let task = task {
            id = task.id
        }
        
        FirestoreService.shared.saveTask(id: id,
                                         title: title,
                                         descipt: desciprtion,
                                         isUrgent: isUrgent,
                                         isImportant: isImportant) { result in
            switch result {
                
            case .success(let okString):
                print(okString)
                self.delegate?.reloadIUI()
                self.delegatee?.updateViews(taskName: title,taskDescript: desciprtion,isImportant: isImportant,isUrgent: isUrgent)
                self.dismiss(animated: true)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

}
