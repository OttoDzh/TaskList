//
//  TaskViewController.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import UIKit

class TaskViewController: UIViewController {
    
    let taskView = TaskView()
    let isFirst: Bool
    var user: ODUser? = nil
    let userId: String
    var tasks = [ODTask]()
    
    init(isFirst:Bool,userId:String) {
        self.isFirst = isFirst
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = taskView
        taskView.tableView.delegate = self
        taskView.tableView.dataSource = self
        addTargets()
        getUserData()
    }

    func getTasks() {
        FirestoreService.shared.getTasks(userID: userId) { result in
            switch result {
            case .success(let tasks):
                self.tasks = tasks
                self.taskView.tableView.reloadData()
            case .failure(_):
                print("error")
            }
        }
    }
    
    func getUserData() {
        
        FirestoreService.shared.getUserData(userID: self.userId) { result in
            switch result {
            case .success(let user):
                self.user = user
                self.getTasks()
            case .failure(let error):
                print(error.localizedDescription)
                self.user = nil
                self.closeSelf()
                
            }
        }
    }

    func addTargets() {
        taskView.addtaskButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        taskView.menuButton.addTarget(self, action: #selector(signOut), for: .touchUpInside)
    }

    func closeSelf() {
        switch isFirst {
        case true:
            let vc = AuthViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        case false:
            self.dismiss(animated: true)
        }
    }
    
    @objc func signOut() {
        AuthService.shared.signOut()
        closeSelf()
    }
    
    @objc func addTask() {
        let vc = CreateTaskViewController(task: nil)
        vc.delegate = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

extension TaskViewController: AddTaskDelegate {
    func reloadIUI() {
        getTasks()
    }
}

extension TaskViewController: DataDelegate {
    func updateAfterEditing() {
        getTasks()
    }
}

extension TaskViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.tasks.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
        cell.taskName.text = tasks[indexPath.row].title
        
        if tasks[indexPath.row].isImportant {
            cell.importantOrNo.image = UIImage(systemName: "figure.run")
            cell.importantOrNo.tintColor = .red
        } else {
            cell.importantOrNo.image = UIImage(systemName: "figure.walk")
            cell.importantOrNo.tintColor = .blue
        }
        
        if tasks[indexPath.row].isUrgent {
            cell.urgentOrNo.image = UIImage(systemName: "figure.run.circle.fill")
            cell.urgentOrNo.tintColor = .red
        } else {
            cell.urgentOrNo.image = UIImage(systemName: "figure.walk.circle.fill")
            cell.urgentOrNo.tintColor = .blue
        }
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            FirestoreService.shared.deleteTask(userId: self.userId, id: self.tasks[indexPath.row].id) { result in
                switch result {
                case .success(let id):
                    print("Task \(id) deleted")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            self.tasks.remove(at: indexPath.row)
            self.taskView.tableView.reloadData()
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailTaskViewController(task: tasks[indexPath.row],userId: userId)
        vc.delegater = self
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    } 
}
