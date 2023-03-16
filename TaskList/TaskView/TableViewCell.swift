//
//  TableViewCell.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 10.02.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseId = "TaskTableCell"
    let taskName = UILabel(text: "Task name", font: ODFonts.boldTextFont)
    let importantOrNo = UIImageView(image: UIImage(systemName: "figure.walk"))
    let urgentOrNo = UIImageView(image: UIImage(systemName: "hourglass"))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.reuseId)
        backgroundColor = UIColor(named: "imageColor")!
        taskName.textColor = .white
        addSubview(taskName)
        addSubview(importantOrNo)
        addSubview(urgentOrNo)
       
        Helper.tamicOff(views: [taskName,importantOrNo,urgentOrNo])

        NSLayoutConstraint.activate([taskName.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     taskName.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     taskName.heightAnchor.constraint(equalToConstant: 40)])
        
        NSLayoutConstraint.activate([importantOrNo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12),
                                     importantOrNo.topAnchor.constraint(equalTo: topAnchor,constant:12),
                                     urgentOrNo.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -12),
                                     urgentOrNo.topAnchor.constraint(equalTo: topAnchor,constant: 12),
                                     importantOrNo.widthAnchor.constraint(equalToConstant: 25),
                                     importantOrNo.heightAnchor.constraint(equalToConstant: 25),
                                     urgentOrNo.widthAnchor.constraint(equalToConstant: 25),
                                     urgentOrNo.heightAnchor.constraint(equalToConstant: 25)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
