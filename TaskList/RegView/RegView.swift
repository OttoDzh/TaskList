//
//  AuthView.swift
//  TaskList
//
//  Created by Otto Dzhandzhuliya on 08.02.2023.
//

import UIKit

class RegView: UIView {
    
    let backView = UIView()
    let taskLabel = UILabel(text: "Task List", font: ODFonts.titleLabelFont)
    let emailLabel = UILabel(text: "Email", font: ODFonts.avenirFont)
    let emailImage = UIImageView(image: UIImage(systemName: "envelope"))
    let emailTf = UITextField(placeholder: "")
    let passwordLabel = UILabel(text: "Password", font: ODFonts.avenirFont)
    let passwordImage = UIImageView(image: UIImage(systemName: "lock.fill"))
    let passwordTf = UITextField(placeholder: "")
    let regButton = UIButton(title: "R E G I S T E R", bgColor: UIColor(named: "imageColor")!, textColor: .white, font: ODFonts.avenirFont, cornerRadius: 21)
    let signInButton = UIButton(title: "SIGN IN", bgColor: UIColor(named: "bgColor")!, textColor: .white, font: ODFonts.titleLabelFont, cornerRadius: 12)


    init() {
        super.init(frame: CGRect())
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .white
        backView.backgroundColor = UIColor(named: "bgColor")
        backView.layer.cornerRadius = 12
        emailLabel.textColor = .lightGray
        emailImage.tintColor = .white
        passwordLabel.textColor = .lightGray
        passwordImage.tintColor = .white
        passwordImage.backgroundColor = UIColor(named: "imageColor")
        emailImage.backgroundColor = UIColor(named: "imageColor")
        emailTf.textAlignment = .justified
        emailTf.minimumFontSize = .infinity
        emailTf.textColor = .white
        passwordTf.textColor = .white
        emailTf.backgroundColor = UIColor(named: "bgColor")
        passwordTf.backgroundColor = UIColor(named: "bgColor")
        emailTf.adSBottomBorder()
        emailTf.autocapitalizationType = .none
        passwordTf.adSBottomBorder()
        passwordTf.autocapitalizationType = .none
        passwordTf.isSecureTextEntry = true
        signInButton.layer.borderWidth = 4
        signInButton.layer.borderColor = CGColor.init(red: 255, green: 126, blue: 121, alpha: 1)
        taskLabel.textColor = UIColor(named: "imageColor")
        
    
     
        
        
     

        
    }
    
    func setupConstraints() {
        
        let stackEmailLabel = UIStackView(arrangedSubviews: [emailImage,emailLabel], axis: .horizontal, spacing: 6)
        let stackPasswordLabel = UIStackView(arrangedSubviews: [passwordImage,passwordLabel], axis: .horizontal, spacing: 6)
        addSubview(taskLabel)
        addSubview(backView)
        
        backView.addSubview(stackEmailLabel)
        backView.addSubview(stackPasswordLabel)
        backView.addSubview(emailTf)
        backView.addSubview(passwordTf)
        addSubview(regButton)
        addSubview(signInButton)
       
      
        
        Helper.tamicOff(views: [backView,stackEmailLabel,emailTf,stackPasswordLabel,passwordTf,regButton,signInButton,taskLabel])
        
        NSLayoutConstraint.activate([backView.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     backView.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     backView.widthAnchor.constraint(equalToConstant: 350),
                                     backView.heightAnchor.constraint(equalToConstant: 450)])
        NSLayoutConstraint.activate([stackEmailLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 36),
                                     stackEmailLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 24),
                                     stackPasswordLabel.leadingAnchor.constraint(equalTo: backView.leadingAnchor,constant: 24),
                                     stackPasswordLabel.topAnchor.constraint(equalTo: emailTf.bottomAnchor, constant: 48)])
        NSLayoutConstraint.activate([emailTf.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     emailTf.topAnchor.constraint(equalTo: stackEmailLabel.bottomAnchor, constant: 12),
                                     emailTf.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 36),
                                     emailTf.trailingAnchor.constraint(equalTo: backView.trailingAnchor,constant:  -36),
                                     passwordTf.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     passwordTf.topAnchor.constraint(equalTo: stackPasswordLabel.bottomAnchor, constant: 12),
                                     passwordTf.widthAnchor.constraint(equalTo: emailTf.widthAnchor),
                                     passwordTf.heightAnchor.constraint(equalTo: emailTf.heightAnchor)])
        NSLayoutConstraint.activate([regButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     regButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor,constant: 20),
                                     regButton.widthAnchor.constraint(equalToConstant: 120),
                                     regButton.heightAnchor.constraint(equalToConstant: 40),
                                     signInButton.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     signInButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -36),
                                     signInButton.widthAnchor.constraint(equalToConstant: 240),
                                     signInButton.heightAnchor.constraint(equalToConstant: 50)])
        NSLayoutConstraint.activate([taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 96),
                                     taskLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    
}


extension UITextField {
    internal func adSBottomBorder(height: CGFloat = 1.0, color: UIColor = .white) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(borderView)
        NSLayoutConstraint.activate(
            [
                borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                borderView.heightAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}

