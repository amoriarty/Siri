//
//  ConversationController.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class ConversationController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
    var senderBottomConstraint: NSLayoutConstraint?
    var collectionViewBottomConstraint: NSLayoutConstraint?
    let cellId = "reuseId"
    var messages: [Message] = [
//        Message(text: "Hey how are you", fromMe: true),
//        Message(text: "I'm seek as hell ...", fromMe: false),
//        Message(text: "And you, how are you ?", fromMe: false),
//        Message(text: "I'm find, hopefully. But I have a lot of works to finally display our conversations.", fromMe: true),
//        Message(text: "I think too, good luck with that !", fromMe: false),
//        Message(text: "Hey how are you", fromMe: true),
//        Message(text: "I'm seek as hell ...", fromMe: false),
//        Message(text: "And you, how are you ?", fromMe: false),
//        Message(text: "I'm find, hopefully. But I have a lot of works to finally display our conversations.", fromMe: true),
//        Message(text: "I think too, good luck with that !", fromMe: false),
//        Message(text: "Hey how are you", fromMe: true),
//        Message(text: "I'm seek as hell ...", fromMe: false),
//        Message(text: "And you, how are you ?", fromMe: false),
//        Message(text: "I'm find, hopefully. But I have a lot of works to finally display our conversations.", fromMe: true),
//        Message(text: "I think too, good luck with that !", fromMe: false),
//        Message(text: "Hey how are you", fromMe: true),
//        Message(text: "I'm seek as hell ...", fromMe: false),
//        Message(text: "And you, how are you ?", fromMe: false),
//        Message(text: "I'm find, hopefully. But I have a lot of works to finally display our conversations.", fromMe: true),
//        Message(text: "I think too, good luck with that !", fromMe: false),
//        Message(text: "Hey how are you", fromMe: true),
//        Message(text: "I'm seek as hell ...", fromMe: false),
//        Message(text: "And you, how are you ?", fromMe: false),
//        Message(text: "I'm find, hopefully. But I have a lot of works to finally display our conversations.", fromMe: true),
//        Message(text: "I think too, good luck with that !", fromMe: false),
    ]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        return collectionView
    }()
    
    lazy var senderView: SenderView = {
        let view = SenderView()
        view.inputTextField.delegate = self
        view.sendButton.addTarget(self, action: #selector(self.toggleSend), for: .touchUpInside)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
        view.addSubview(senderView)
        
        setupLayouts()
        setupKeyboard()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard messages.count > 0 else { return }
        let indexPath = IndexPath(item: messages.count - 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: { _ in
            self.collectionView.reloadData()
        }, completion: nil)
    }
    
    private func setupLayouts() {
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        collectionViewBottomConstraint = collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        collectionViewBottomConstraint?.isActive = true
        
        senderView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        senderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        senderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        senderBottomConstraint = senderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        senderBottomConstraint?.isActive = true
    }
}
