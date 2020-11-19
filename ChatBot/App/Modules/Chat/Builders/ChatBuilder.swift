//
//  ChatBuilder.swift
//  ChatBot
//

import UIKit

class ChatBuilder {
    
    static func pushIn(navigator: UINavigationController, chatRoom: ChatRoom) {
        
        let viewModel = ChatViewModel(chatRoom: chatRoom)
        
        let viewController = ChatViewController()
        viewController.assignDependencies(viewModel: viewModel)
        viewController.title = chatRoom.roomType.title
        
        navigator.pushViewController(viewController, animated: true)
    }
}
