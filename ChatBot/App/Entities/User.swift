//
//  User.swift
//  ChatBot
//

import UIKit

class User {
    
    var name: String   
    var image: UIImage? // avatar image
    var isMe: Bool      // simple flag specifying whether it is me or another user I am contacting with
    
    init(name: String, isMe: Bool = false) {
        self.name = name
        self.image = UIImage(named: name.lowercased())
        self.isMe = isMe
    }
}
