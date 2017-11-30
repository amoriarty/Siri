//
//  ViewController.swift
//  Siri
//
//  Created by Alexandra Legent on 29/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let cellId = "cellId"
    let questionsAnswers = [
        QuestionAnswer(question: "What time is it ?", response: "08h42"),
        QuestionAnswer(question: "Shall we dance ?", response: "I can't, I'm an iPhone"),
        QuestionAnswer(question: "Siri, who is the prettier ?", response: "I don't have any info for that, but probably not you !"),
        QuestionAnswer(question: "You say what what ?", response: "In the butt"),
        QuestionAnswer(question: "lorem ipsum ?", response: "Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.Quod saepe saepe vel ea fugit esse. Quisquam ducimus officia et porro temporibus sit. Perspiciatis iste est libero ratione beatae. Sunt non minus molestias explicabo tempora sint.")
    ]
    
    let questionField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Ask me something ..."
        field.layer.borderColor = UIColor.blue.cgColor
        field.layer.borderWidth = 0.5
        field.layer.cornerRadius = 5
        field.font = .systemFont(ofSize: 22)
        return field
    }()
    
    let askButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ask", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 22)
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

