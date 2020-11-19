//
//  ChatServices.swift
//  ChatBot
//

import Foundation
import Combine

class ChatServices {
    
    static let shared = ChatServices()
    
    // MARK: Attributes
    
    var activeRooms = Set<ChatRoom>()
    
    let didReceiveMessage = PassthroughSubject<ChatRoom, Never>()
    
    // MARK: Logic
    
    func createRoom(roomType: ChatRoomType) -> ChatRoom {
        let room = ChatRoom(roomType: roomType)
        activeRooms.insert(room)
        activate(chatBots: roomType.users, for: room)
        return room
    }
    
    func close(room: ChatRoom) {
        activeRooms.remove(room)
    }
    
    private func activate(chatBots: [User], for room: ChatRoom) {
        
        chatBots.forEach { (user) in
            if !user.isMe {
                (user as! ChatBot).activate(chatRoom: room)
            }
        }
    }
    
    // MARK: Services
    
    struct Requests {
        
        static func send(messageData: ChatMessageData, to room: ChatRoom) {
            room.add(messageData: messageData)
            ChatServices.shared.didReceiveMessage.send(room)
        }
    }
}
