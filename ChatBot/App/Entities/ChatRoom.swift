//
//  ChatRoom.swift
//  ChatBot
//

import Foundation

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
        messagesData.last!
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
