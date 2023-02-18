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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: TableViewCell.reuseId)
        
        backgroundColor = UIColor(named: "imageColor")!
        
        taskName.textColor = .white
        addSubview(taskName)
        Helper.tamicOff(views: [taskName])
        
        
        NSLayoutConstraint.activate([taskName.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     taskName.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     taskName.heightAnchor.constraint(equalToConstant: 40)])
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
