//
//  User.swift
//  ChatBot
//

import UIKit

class User {
    
    var name: String
    var image: UIImage?
    var isMe: Bool
    
    init(name: String, isMe: Bool = false) {
        self.name = name
        self.image = UIImage(named: name.lowercased())
        self.isMe = isMe
    }
}
