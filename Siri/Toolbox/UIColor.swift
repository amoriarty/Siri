//
//  UIColor.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

extension UIColor {
    static let siriLightGray = UIColor(r: 230, g: 230, b: 230)
    static let siriLightBlue = UIColor(r: 10, g: 146, b: 242)
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
}
