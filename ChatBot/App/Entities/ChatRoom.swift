//
//  ChatRoom.swift
//  ChatBot
//

import Foundation
import Combine

class ChatRoom {
    
    var roomType: ChatRoomType
    var messagesData: [ChatMessageData] = []
    
    var id: String {
        return roomType.id
    }
    
    init(roomType: ChatRoomType) {
        self.roomType = roomType
    }
    
    func add(messageData: ChatMessageData) {
        messagesData.append(messageData)
    }
    
    var receivedMessage: ChatMessageData {
        return messagesData.last ?? ChatMessageData(user: roomType.users.first!, messageType: .text(""))
    }
    
    var meUser: User {
        return roomType.users.first(where: { $0.isMe == true })!
    }
}

extension ChatRoom: Hashable {
    
    public static func == (lhs: ChatRoom, rhs: ChatRoom) -> Bool {
        return lhs.roomType == rhs.roomType
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(roomType)
    }
}
