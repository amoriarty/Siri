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
    let response: String
    
    var attributed: NSAttributedString {
        let attributed = NSMutableAttributedString(string: question, attributes: [
            .font : UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.lightGray
        ])
        
        let responseAttributed = NSAttributedString(string: "\n\(response)", attributes: [
            .font: UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor.black
        ])
        
        attributed.append(responseAttributed)
        return attributed
    }
}
