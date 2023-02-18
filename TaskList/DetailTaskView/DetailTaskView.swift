//
//  DetailTaskView.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 12.02.2023.
//

import UIKit

class DetailTaskView: UIView {
    
    let taskNameLabel = UILabel(text: "Task name", font: ODFonts.titleLabelFont)
    let importantLabel = UILabel(text: "Important?", font: ODFonts.regulatTextFont)
    let desciptText = UITextView()
    let deleteButton = UIButton(title: "Delete", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    let editButton = UIButton(title: "Edit", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)
    let doneButton = UIButton(title: "Done", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 15)

    init() {
        super.init(frame: CGRect())
        setupConstraints()
        setupViews()
    }
    
    func setupViews() {
    backgroundColor = UIColor(named: "bgColor")
        taskNameLabel.textColor = .white
        importantLabel.textColor = .white
        desciptText.backgroundColor = UIColor(named: "buttonColor")!
        desciptText.text = "Task descript"
        desciptText.layer.cornerRadius = 15
        desciptText.textColor = .white
        desciptText.isEditable = false
    }
    
    func setupConstraints() {
        
        let buttonStack = UIStackView(arrangedSubviews: [deleteButton,editButton], axis: .horizontal, spacing: 15)
        
        addSubview(taskNameLabel)
        addSubview(importantLabel)
        addSubview(desciptText)
        addSubview(buttonStack)
        addSubview(doneButton)
        
        Helper.tamicOff(views: [taskNameLabel,importantLabel,desciptText,buttonStack,doneButton])
        
        NSLayoutConstraint.activate([taskNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 96),
                                     taskNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     importantLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 16),
                                     importantLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     desciptText.topAnchor.constraint(equalTo: importantLabel.bottomAnchor, constant: 32),
                                     desciptText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                                     desciptText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                                     desciptText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200),
                                     buttonStack.topAnchor.constraint(equalTo: desciptText.bottomAnchor, constant: 24),
                                     buttonStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                                     buttonStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                                     deleteButton.widthAnchor.constraint(equalTo: editButton.widthAnchor),
                                     deleteButton.heightAnchor.constraint(equalToConstant: 48),
                                     editButton.heightAnchor.constraint(equalToConstant: 48),
                                     doneButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     doneButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
                                     doneButton.widthAnchor.constraint(equalTo: editButton.widthAnchor),
                                     doneButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
