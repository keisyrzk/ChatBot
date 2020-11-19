//
//  ChatRoomType.swift
//  ChatBot
//

import Foundation

enum ChatRoomType {
    
    case oneOnOne(users: [User], roomId: String)
    case oneToMany(users: [User], roomId: String)
    
    var title: String {
        switch self {
        case .oneOnOne:
            return "One on One"
        case .oneToMany:
            return "Group"
        }
    }
    
    var id: String {
        switch self {
        case let .oneOnOne(_, id):
            return id
        case let .oneToMany(_, id):
            return id
        }
    }
    
    var users: [User] {
        switch self {
        case let .oneOnOne(users, _):
            return users
        case let .oneToMany(users, _):
            return users
        }
    }
}

extension ChatRoomType: Hashable {
    
    public static func == (lhs: ChatRoomType, rhs: ChatRoomType) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}
