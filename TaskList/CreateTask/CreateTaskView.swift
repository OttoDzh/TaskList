//
//  CreateTaskView.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 11.02.2023.
//

import UIKit

class CreateTaskView: UIView {
    
    let addTaskLabel = UILabel(text: "Add Task", font: ODFonts.titleLabelFont)
    let taskNameTf = UITextField(placeholder: "Task name")
    let taskDecsriptTf = UITextField(placeholder: "Task description")
    let isImportant = UISwitch()
    let isImportantLabel = UILabel(text: "Is important?", font: ODFonts.avenirFont)
    let isUrgent = UISwitch()
    let isUrgentLabel = UILabel(text: "Is urgent?", font: ODFonts.avenirFont)
    let cancelButton = UIButton(title: "Cancel", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    let saveButton = UIButton(title: "Save", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    
    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        backgroundColor = UIColor(named: "bgColor")
        addTaskLabel.textColor = .white
        taskNameTf.layer.cornerRadius = 15
        taskNameTf.textColor = .black
        taskDecsriptTf.layer.cornerRadius = 15
        taskDecsriptTf.textColor = .black
        isImportantLabel.textColor = .white
        isUrgentLabel.textColor = .white
        let placeholderTextForName = NSAttributedString(string: "Task name",attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        taskNameTf.attributedPlaceholder = placeholderTextForName
        let placeholderTextForDesc = NSAttributedString(string: "Task description",attributes: [NSAttributedString.Key.foregroundColor : UIColor.darkGray])
        taskDecsriptTf.attributedPlaceholder = placeholderTextForDesc
    }
    
    func setupConstraints() {
        let stackTf = UIStackView(arrangedSubviews: [taskNameTf,taskDecsriptTf], axis: .vertical, spacing: 6)
        let isImportantStack = UIStackView(arrangedSubviews: [isImportant,isImportantLabel], axis: .vertical, spacing: 3)
        let isUrgentStack = UIStackView(arrangedSubviews: [isUrgent,isUrgentLabel], axis: .vertical, spacing: 3)
        let switchStack = UIStackView(arrangedSubviews: [isImportantStack,isUrgentStack], axis: .horizontal, spacing: 16)
        let buttonStack = UIStackView(arrangedSubviews: [cancelButton,saveButton], axis: .horizontal, spacing: 15)
        addSubview(addTaskLabel)
        addSubview(stackTf)
        addSubview(switchStack)
        addSubview(buttonStack)
        
        Helper.tamicOff(views: [addTaskLabel,stackTf,switchStack,buttonStack])
        
        NSLayoutConstraint.activate([addTaskLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     addTaskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 260),
                                     stackTf.topAnchor.constraint(equalTo: addTaskLabel.bottomAnchor, constant: 36),
                                     stackTf.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     stackTf.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     stackTf.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     taskNameTf.heightAnchor.constraint(equalToConstant: 48),
                                     taskDecsriptTf.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([switchStack.topAnchor.constraint(equalTo: stackTf.bottomAnchor, constant: 36),
                                     switchStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),
                                     switchStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)])
        
        NSLayoutConstraint.activate([buttonStack.topAnchor.constraint(equalTo: switchStack.bottomAnchor, constant: 36),
                                     buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     cancelButton.heightAnchor.constraint(equalToConstant: 48),
                                     saveButton.heightAnchor.constraint(equalToConstant: 48),
                                     saveButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
