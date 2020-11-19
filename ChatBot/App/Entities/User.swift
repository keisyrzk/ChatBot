//
//  User.swift
//  ChatBot
//

import Foundation

class User {
    
    var name: String
    var isMe: Bool
    
    init(name: String, isMe: Bool = false) {
        self.name = name
        self.isMe = isMe
    }
}
