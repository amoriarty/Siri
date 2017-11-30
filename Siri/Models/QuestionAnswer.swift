//
//  QuestionAnswer.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

struct QuestionAnswer {
    let question: String
    let answer: String
    
    var attributed: NSAttributedString {
        let attributed = NSMutableAttributedString(string: question, attributes: [
            .font : UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.lightGray
        ])
        
        let answerAttributed = NSAttributedString(string: "\n\(answer)", attributes: [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ])
        
        attributed.append(answerAttributed)
        return attributed
    }
}
