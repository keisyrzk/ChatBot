//
//  ChatBuilder.swift
//  ChatBot
//

import UIKit

class ChatBuilder {
    
    static func pushIn(navigator: UINavigationController, chatType: ChatType) {
        
        let viewModel = ChatViewModel(chatType: chatType)
        
        let viewController = ChatViewController()
        viewController.assignDependencies(viewModel: viewModel)
        viewController.title = chatType.title
        
        navigator.pushViewController(viewController, animated: true)
    }
}
