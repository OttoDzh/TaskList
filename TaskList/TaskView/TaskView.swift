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
    let uiButton = UIButton(title: "Urgent!                Important!", bgColor: UIColor(named: "buttonColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 12)
    let uniButton = UIButton(title: "Urgent!               NotImportant!", bgColor: UIColor(named: "buttonColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 12)
    let nuiButton = UIButton(title: "NotUrgent!            Important!", bgColor: UIColor(named: "buttonColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 12)
    let nuniButton = UIButton(title: "NotUrgent!           NotImportant!", bgColor: UIColor(named: "buttonColor")!, textColor: .white, font:
                                ODFonts.avenirFont, cornerRadius: 12)
    let tableView = UITableView()

    init() {
        
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews(){
        backgroundColor = UIColor(named: "bgColor")
        
        let buttons = [uiButton,uniButton,nuiButton,nuniButton]
        for but in buttons {
            but.titleLabel?.lineBreakMode = .byWordWrapping
            but.titleLabel?.textAlignment = .center
        }
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        tableView.backgroundColor = UIColor(named: "imageColor")!
        tableView.layer.cornerRadius = 15
        tableView.separatorStyle = .none
        
        
        
        
    }
    
    func setupConstraints() {
        
        let stacku = UIStackView(arrangedSubviews: [uiButton,uniButton], axis: .horizontal, spacing: 24)
        let stackn = UIStackView(arrangedSubviews: [nuiButton,nuniButton], axis: .horizontal, spacing: 24)

        addSubview(tableView)
        addSubview(menuButton)
        addSubview(addtaskButton)
        addSubview(stacku)
        addSubview(stackn)
//        addSubview(stacknu)
//        addSubview(uiButton)
//        addSubview(uniButton)
//        addSubview(nuiButton)
//        addSubview(nuniButton)
        
        
        
        
     
        
        Helper.tamicOff(views: [menuButton,addtaskButton,uiButton,uniButton,nuiButton,nuniButton,tableView,stackn,stacku])
        
        NSLayoutConstraint.activate([menuButton.topAnchor.constraint(equalTo: topAnchor, constant: 60),
                                     menuButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     addtaskButton.topAnchor.constraint(equalTo: menuButton.topAnchor),
                                     addtaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
                                     menuButton.widthAnchor.constraint(equalToConstant: 120),
                                     menuButton.heightAnchor.constraint(equalToConstant: 60),
                                     addtaskButton.widthAnchor.constraint(equalTo: menuButton.widthAnchor),
                                     addtaskButton.heightAnchor.constraint(equalTo: menuButton.heightAnchor)])
        
        NSLayoutConstraint.activate([stacku.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     stacku.topAnchor.constraint(equalTo: menuButton.bottomAnchor, constant: 48),
                                     stackn.topAnchor.constraint(equalTo: stacku.bottomAnchor,constant: 12),
                                     stackn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     uiButton.widthAnchor.constraint(equalToConstant: 180),
                                     uiButton.heightAnchor.constraint(equalToConstant: 180),
                                     uniButton.widthAnchor.constraint(equalToConstant: 180),
                                     uniButton.heightAnchor.constraint(equalToConstant: 180),
                                     nuiButton.widthAnchor.constraint(equalToConstant: 180),
                                     nuiButton.heightAnchor.constraint(equalToConstant: 180),
                                     nuniButton.widthAnchor.constraint(equalToConstant: 180),
                                     nuniButton.heightAnchor.constraint(equalToConstant: 180)])
        
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: stackn.bottomAnchor, constant: 24),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -24)])
        
        
        
        
    }
    
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
