//
//  ChatViewModel.swift
//  ChatBot
//

import Foundation
import Combine

class ChatViewModel {
    
    let chatRoom: ChatRoom
    
    init(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
    }
    
    func initSections() -> [GenericSectionModel] {
        return [GenericSectionModel.WithoutHeader(title: "chatRoom", items: [])]
    }
    
    func createMessageItem(chatMessageData: ChatMessageData) -> GenericSectionItem {
        return GenericSectionItem.ChatMessageItem(title: String.randomAlphanumeric(),
                                                  chatMessageData: chatMessageData)
    }
}
