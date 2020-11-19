//
//  ChatBuilder.swift
//  ChatBot
//

import UIKit

class ChatBuilder {
    
    static func pushIn(navigator: UINavigationController, chatRoomType: ChatRoomType) {
        
        let viewModel = ChatViewModel(chatRoomType: chatRoomType)
        
        let viewController = ChatViewController()
        viewController.assignDependencies(viewModel: viewModel)
        viewController.title = chatRoomType.title
        
        navigator.pushViewController(viewController, animated: true)
    }
}
