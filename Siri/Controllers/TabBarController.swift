//
//  TabBarController.swift
//  Siri
//
//  Created by Alexandra Legent on 30/11/2017.
//  Copyright © 2017 Alexandre Legent. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    let requestController: RequestController = {
        let controller = RequestController()
        let image = UIImage(named: "SubjectIcon")
        controller.tabBarItem.title = "Request"
        controller.tabBarItem.image = image
        return controller
    }()
    
    
    let conversationController: ConversationController = {
        let controller = ConversationController()
        let image = UIImage(named: "QuestionAnswerIcon")
        controller.tabBarItem.title = "Conversation"
        controller.tabBarItem.image = image
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [requestController, conversationController]
        tabBar.isTranslucent = false
    }
}
