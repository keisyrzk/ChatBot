//
//  ChatServices.swift
//  ChatBot
//

import Foundation

class ChatServices {
    
    static let shared = ChatServices()
    
    // MARK: Attributes
    
    var activeRooms = Set<ChatRoomType>()
    
    // MARK: Logic
    
    func createRoom(roomType: ChatRoomType) -> ChatRoomType {
        activeRooms.insert(roomType)
        return roomType
    }
    
    func closeRoom(roomType: ChatRoomType) {
        activeRooms.remove(roomType)
    }
}
