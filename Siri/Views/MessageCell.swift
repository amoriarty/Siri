//
//  MessageCell.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class MessageCell: UICollectionViewCell {
    var bubbleWidthConstraint: NSLayoutConstraint?
    var bubbleLeftConstraint: NSLayoutConstraint?
    var bubbleRightConstraint: NSLayoutConstraint?
    var message: Message? {
        didSet {
            guard let message = message else { return }
            messageTextView.text = message.text
            switch message.fromMe {
            case true:
                messageTextView.textColor = .white
                bubbleView.backgroundColor = .siriLightBlue
                bubbleLeftConstraint?.isActive = false
                bubbleRightConstraint?.isActive = true
            case false:
                messageTextView.textColor = .black
                bubbleView.backgroundColor = .siriLightGray
                bubbleRightConstraint?.isActive = false
                bubbleLeftConstraint?.isActive = true
            }
        }
    }
    
    let bubbleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.layer.cornerRadius = 15
        return view
    }()
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isSelectable = false
        textView.isEditable = false
        textView.font = .systemFont(ofSize: 18)
        textView.textContainerInset = UIEdgeInsets(top: -4, left: -4, bottom: 0, right: -4)
        textView.backgroundColor = .clear
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(bubbleView)
        bubbleView.addSubview(messageTextView)
        
        setupLayouts()
    }
    
    private func setupLayouts() {
        bubbleView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        bubbleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        bubbleLeftConstraint = bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        bubbleRightConstraint = bubbleView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        bubbleWidthConstraint = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthConstraint?.isActive = true
        
        
        messageTextView.topAnchor.constraint(equalTo: bubbleView.topAnchor, constant: 10).isActive = true
        messageTextView.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -10).isActive = true
        messageTextView.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 10).isActive = true
        messageTextView.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
