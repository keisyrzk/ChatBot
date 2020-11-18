//
//  ChatType.swift
//  ChatBot
//

import Foundation

enum ChatType {
    
    case oneOnOne(User)
    case oneToMany([User])
}
