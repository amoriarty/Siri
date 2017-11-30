//
//  ResponseCell.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class ResponseCell: UITableViewCell {
    var item: QuestionAnswer? {
        didSet { textView.attributedText = item?.attributed }
    }
    
    let bottomBorder: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .siriLightGray
        return view
    }()
    
    let textView: UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isSelectable = false
        text.isScrollEnabled = false
        text.isEditable = false
        text.textContainerInset = UIEdgeInsets(top: -4, left: -4, bottom: 0, right: -4)
        return text
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(bottomBorder)
        addSubview(textView)
        setupLayouts()
    }
    
    private func setupLayouts() {
        bottomBorder.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bottomBorder.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        bottomBorder.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        textView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
