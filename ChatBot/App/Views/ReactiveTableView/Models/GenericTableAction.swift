//
//  GenericTableAction.swift
//  ChatBot
//

import Foundation

enum ButtonTypeAction {
    
    
}

indirect enum GenericTableAction {
    
    case DeleteItem(index: IndexPath)
    case Delete(section: Int)
    case SelectedRoom(ChatRoom)
}
