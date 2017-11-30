//
//  RequestController+Request.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

extension RequestController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        toggleAsk()
        return true
    }
    
    @objc func toggleAsk() {
        questionField.resignFirstResponder()
        
        guard let question = questionField.text, question.count > 0 else { return }
        
        questionField.text = nil
        RecastService.shared.getLocation(for: question) { location, error in
            guard let location = location, error == nil else {
                self.add(question: question)
                return
            }
            
            DarkSkyService.shared.getSummary(for: location, completion: { summary, error in
                guard let summary = summary, error == nil else {
                    self.add(question: question)
                    return
                }
                
                self.add(question: question, answer: summary)
            })
        }
    }

    private func add(question: String, answer: String = "Error") {
        let item = QuestionAnswer(question: question, answer: answer)
        let indexPath = IndexPath(item: 0, section: 0)
        items = [item] + items
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
}
