//
//  ChatViewModel.swift
//  ChatBot
//

import Foundation
import Combine

class ChatViewModel {
    
    let chatRoomType: ChatRoomType
    
    init(chatRoomType: ChatRoomType) {
        self.chatRoomType = chatRoomType
    }
    
//    func generateSections() -> AnyPublisher<[GenericSectionModel], Never> {
//        
//        let sections = [GenericSectionModel.WithoutHeader(title: "chatRoom", items: <#T##[GenericSectionItem]#>)]
//    }
}
