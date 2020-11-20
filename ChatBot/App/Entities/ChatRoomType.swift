//
//  ChatRoomType.swift
//  ChatBot
//

import Foundation

/**
    This enum specifies the room types. Basically there are just to types: `one on one` and `one to many` aka `group conversation`. Each conversation should hold the room participants (users) and the room Id to let the app know about the room.
 */
enum ChatRoomType {
    
    case oneOnOne(users: [User], roomId: String)
    case oneToMany(users: [User], roomId: String)
    
    /**
        Each room type may have its own predefined title that might be presented in a navigation bar.
     */
    var title: String {
        switch self {
        case .oneOnOne:
            return "One on One"
        case .oneToMany:
            return "Group"
        }
    }
    
    /**
        A unique identifier getter
     */
    var id: String {
        switch self {
        case let .oneOnOne(_, id):
            return id
        case let .oneToMany(_, id):
            return id
        }
    }
    
    /**
        Room users getter
     */
    var users: [User] {
        switch self {
        case let .oneOnOne(users, _):
            return users
        case let .oneToMany(users, _):
            return users
        }
    }
}

/**
    Hashable lets the room type be comparable
 */
extension ChatRoomType: Hashable {
    
    public static func == (lhs: ChatRoomType, rhs: ChatRoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}
