//
//  ConversationController+TextField.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

extension ConversationController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        toggleSend()
        return true
    }
    
    @objc func toggleSend() {
        senderView.inputTextField.resignFirstResponder()
        
        guard let text = senderView.inputTextField.text, text.count > 0 else { return }
        
        senderView.inputTextField.text = nil
        addMessage(text: text, fromMe: true)
        RecastService.shared.getLocation(for: text) { location, error in
            guard let location = location, error == nil else {
                self.addMessage()
                return
            }
            
            DarkSkyService.shared.getSummary(for: location, completion: { summary, error in
                guard let summary = summary, error == nil else {
                    self.addMessage()
                    return
                }
                
                self.addMessage(text: "The weather in \(location.raw) is \(summary).")
            })
        }
        
        RecastService.shared.send(message: text) { response, error in
            return
        }
    }
    
    private func addMessage(text: String = "I'm sorry, I don't understand.", fromMe: Bool = false) {
        let message = Message(text: text, fromMe: fromMe)
        let indexPath = IndexPath(item: messages.count, section: 0)
        
        messages.append(message)
        collectionView.reloadData()
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
}
