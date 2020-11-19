//
//  GenericSectionItem.swift
//  ChatBot
//

import UIKit

enum GenericSectionItem {
    // title is HAVE TO BE a unique identifier - to comapre, delete, remove, add items

    // Cells
    case ChatMessageItem(title: String, chatMessageData: ChatMessageData)
    case ChatRoomItem(title: String, chatRoom: ChatRoom)
}

extension GenericSectionItem: Equatable {
    
    var data: Any? {
        switch self {

        case .ChatMessageItem(title: _, chatMessageData: let data):
            return data
        case .ChatRoomItem(title: _, chatRoom: let data):
            return data
        }
    }
    
    var title: String {
        switch self {
        case
            .ChatRoomItem(title: let title, chatRoom: _),
            .ChatMessageItem(title: let title, chatMessageData: _):
            
            return title
        }
    }
    
    var identity: String {
        return title
    }
    
    init(original: GenericSectionItem, id: String) {
        
        switch original {
        case let .ChatMessageItem(title: _, chatMessageData: chatMessageData):
            self = .ChatMessageItem(title: id, chatMessageData: chatMessageData)
        case let .ChatRoomItem(title: _, chatRoom: chatRoom):
            self = .ChatRoomItem(title: id, chatRoom: chatRoom)
        }
    }
}

extension GenericSectionItem {
    
    // A method comparing two items more extensively then simple "==", returns false even if the cells are actually the same cell, but the content has changed
    func equalDetailed(to other: GenericSectionItem) -> Bool {
        
        if case let .ChatMessageItem(title: titlel, chatMessageData: _) = other {
            guard case let .ChatMessageItem(title: titler, chatMessageData: _) = self else {
                return false
            }
            return titlel == titler
        }
        
        if case let .ChatRoomItem(title: titlel, chatRoom: _) = other {
            guard case let .ChatRoomItem(title: titler, chatRoom: _) = self else {
                return false
            }
            return titlel == titler
        }
                                
        return false
    }
}

// equatable, this is needed to detect changes
func == (lhs: GenericSectionItem, rhs: GenericSectionItem) -> Bool {
    
    switch (lhs, rhs) {

    case (let .ChatMessageItem(title: titlel, chatMessageData: _), let .ChatMessageItem(title: titler, chatMessageData: _)):
        return titlel == titler
    case (let .ChatRoomItem(title: titlel, chatRoom: _), let .ChatRoomItem(title: titler, chatRoom: _)):
        return titlel == titler
    default:
        return lhs.identity == rhs.identity
    }
}

