//
//  SenderView.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class SenderView: UIView {
    let topBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .siriLightGray
        return view
    }()
    
    let inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter your message here."
        textField.returnKeyType = .send
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Send", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        addSubview(topBorder)
        addSubview(inputTextField)
        addSubview(sendButton)
        
        setupLayouts()
    }
    
    private func setupLayouts() {
        topBorder.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBorder.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topBorder.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topBorder.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        inputTextField.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
        inputTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
        inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        inputTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -5).isActive = true
        
        sendButton.topAnchor.constraint(equalTo: inputTextField.topAnchor).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: inputTextField.bottomAnchor).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
