//
//  TaskView.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import UIKit

class TaskView: UIView {
    
    let menuButton = UIButton(title: "Exit", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    let addtaskButton = UIButton(title: "+", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    let tableView = UITableView()

    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func setupViews(){
        backgroundColor = UIColor(named: "bgColor")
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        tableView.backgroundColor = UIColor(named: "imageColor")!
        tableView.layer.cornerRadius = 15
        tableView.separatorStyle = .none
    }
    
    func setupConstraints() {
        addSubview(tableView)
        addSubview(menuButton)
        addSubview(addtaskButton)
      
        Helper.tamicOff(views: [menuButton,addtaskButton,tableView])
        
        NSLayoutConstraint.activate([menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                                     menuButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     addtaskButton.topAnchor.constraint(equalTo: menuButton.topAnchor),
                                     addtaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     menuButton.widthAnchor.constraint(equalToConstant: 120),
                                     menuButton.heightAnchor.constraint(equalToConstant: 60),
                                     addtaskButton.widthAnchor.constraint(equalTo: menuButton.widthAnchor),
                                     addtaskButton.heightAnchor.constraint(equalTo: menuButton.heightAnchor)])
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 24),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -24)])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
