//
//  ChatServices.swift
//  ChatBot
//

import Foundation
import Combine

/**
    Services class responsible to hold rooms operations and chat bots
 */
class ChatServices {
    
    static let shared = ChatServices()
    
    // MARK: Attributes
    
    /**
        Holds all the active rooms so the app's user may enter any room any time until it is closed
     */
    var activeRooms = Set<ChatRoom>()
    
    /**
        An observable that handles receiving a new message
     */
    let didReceiveMessage = PassthroughSubject<ChatRoom, Never>()
    
    // MARK: Logic
    
    /**
        Creates a new chat room, store it among the active rooms adn activates all the chat bots being participants in it
     */
    func createRoom(roomType: ChatRoomType) -> ChatRoom {
        let room = ChatRoom(roomType: roomType)
        activeRooms.insert(room)
        activate(chatBots: roomType.users, for: room)
        return room
    }
    
    /**
        Closes the selected room - deactivates it
     */
    func close(room: ChatRoom) {
        activeRooms.remove(room)
    }
    
    /**
        Activates all chat bots
     */
    private func activate(chatBots: [User], for room: ChatRoom) {
        
        chatBots.forEach { (user) in
            if !user.isMe {
                (user as! ChatBot).activate(chatRoom: room)
            }
        }
    }
    
    /**
        Restarts all the chat bots - it is called each time the user sends a message to the room. In an effect we see a live chatting simulation between the user and the chat bots.
     */
    func restartBots(for room: ChatRoom) {
        
        room.roomType.users.forEach { (user) in
            if !user.isMe {
                (user as! ChatBot).restart()
            }
        }
    }
    
    // MARK: Services
    
    /**
        Handles all the chat requests like sending a new message to the room
     */
    struct Requests {
        
        static func send(messageData: ChatMessageData, to room: ChatRoom) {
            room.add(messageData: messageData)
            ChatServices.shared.didReceiveMessage.send(room)
        }
    }
}
