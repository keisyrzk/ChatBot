//
//  ChatType.swift
//  ChatBot
//

import Foundation

enum ChatType {
    
    case oneOnOne(User)
    case oneToMany([User])
    
    var title: String {
        switch self {
        case .oneOnOne:
            return "One on One"
        case .oneToMany:
            return "Group"
        }
    }
}
