//
//  ChatRoom.swift
//  ChatBot
//

import Foundation
import Combine

/**
    The chat room should hold its type and messages data already send in this room.
 */
class ChatRoom {
    
    var roomType: ChatRoomType
    var messagesData: [ChatMessageData] = []
    
    /**
        Unique id getter
     */
    var id: String {
        return roomType.id
    }
    
    init(roomType: ChatRoomType) {
        self.roomType = roomType
    }
    
    /**
        Adds a new mesage to the room's storage
     */
    func add(messageData: ChatMessageData) {
        messagesData.append(messageData)
    }
    
    /**
        Last receive message getter - it is used to present the last message send in the room on a Room Cell view
     */
    var receivedMessage: ChatMessageData {
        return messagesData.last ?? ChatMessageData(user: roomType.users.first!, messageType: .text(""))
    }
    
    /**
        The user that is a representation of "me" aka this device holder
     */
    var meUser: User {
        return roomType.users.first(where: { $0.isMe == true })!
    }
}

/**
    Hashable lets the room be comparable
 */
extension ChatRoom: Hashable {
    
    public static func == (lhs: ChatRoom, rhs: ChatRoom) -> Bool {
        return lhs.roomType == rhs.roomType
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(roomType)
    }
}
