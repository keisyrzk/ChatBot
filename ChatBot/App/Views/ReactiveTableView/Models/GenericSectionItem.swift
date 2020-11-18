//
//  GenericSectionItem.swift
//  ChatBot
//

import UIKit

enum GenericSectionItem {
    // title is HAVE TO BE a unique identifier - to comapre, delete, remove, add items

    // Cells
    case ChatMessageItem(title: String, chatMessageData: ChatMessageData)
}

extension GenericSectionItem: Equatable {
    
    var data: Any? {
        switch self {

        case .ChatMessageItem(title: _, chatMessageData: let data):
            return data
        }
    }
    
    var title: String {
        switch self {
        case
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
                                
        return false
    }
}

// equatable, this is needed to detect changes
func == (lhs: GenericSectionItem, rhs: GenericSectionItem) -> Bool {
    
    switch (lhs, rhs) {

    case (let .ChatMessageItem(title: titlel, chatMessageData: _), let .ChatMessageItem(title: titler, chatMessageData: _)):
        return titlel == titler
    }
}

