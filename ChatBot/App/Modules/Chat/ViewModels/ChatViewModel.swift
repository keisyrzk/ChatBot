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
        
        let items: [GenericSectionItem] = chatRoom.messagesData.map{ .ChatMessageItem(title: String.randomAlphanumeric(),
                                                                                      chatMessageData: $0) }
        return [GenericSectionModel.WithoutHeader(title: "chatRoom",
                                                  items: items,
                                                  canEdit: false)]
    }
    
    func createMessageItem(chatMessageData: ChatMessageData) -> GenericSectionItem {
        return GenericSectionItem.ChatMessageItem(title: String.randomAlphanumeric(),
                                                  chatMessageData: chatMessageData)
    }
}
