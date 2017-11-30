//
//  RequestController.swift
//  Siri
//
//  Created by Alexandra Legent on 29/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit
import RecastAI
import ForecastIO

class RequestController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    let cellId = "cellId"
    var items = [QuestionAnswer]()
    
    lazy var questionField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Ask me something ..."
        field.layer.borderColor = UIColor.siriLightBlue.cgColor
        field.layer.borderWidth = 0.5
        field.layer.cornerRadius = 5
        field.font = .systemFont(ofSize: 22)
        field.delegate = self
        field.returnKeyType = .send
        return field
    }()
    
    lazy var askButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .siriLightBlue
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.addTarget(self, action: #selector(self.toggleAsk), for: .touchUpInside)
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(ResponseCell.self, forCellReuseIdentifier: cellId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(questionField)
        view.addSubview(askButton)
        view.addSubview(tableView)
        setupLayouts()
    }
    
    private func setupLayouts() {
        questionField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        questionField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5).isActive = true
        questionField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5).isActive = true
        
        askButton.topAnchor.constraint(equalTo: questionField.bottomAnchor, constant: 5).isActive = true
        askButton.leadingAnchor.constraint(equalTo: questionField.leadingAnchor).isActive = true
        askButton.trailingAnchor.constraint(equalTo: questionField.trailingAnchor).isActive = true
        
        tableView.topAnchor.constraint(equalTo: askButton.bottomAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

