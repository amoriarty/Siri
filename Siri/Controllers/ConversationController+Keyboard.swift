//
//  ConversationController+Keyboard.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

extension ConversationController {
    func setupKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else { return }
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        guard let tabBarHeight = tabBarController?.tabBar.frame.height else { return }
        
        collectionViewBottomConstraint?.constant = -(keyboardFrame.height - tabBarHeight)
        senderBottomConstraint?.constant = -(keyboardFrame.height - tabBarHeight)
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        guard let duration = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else { return }
        
        collectionViewBottomConstraint?.constant = 0
        senderBottomConstraint?.constant = 0
        UIView.animate(withDuration: duration) {
            self.view.layoutIfNeeded()
        }
    }
}
