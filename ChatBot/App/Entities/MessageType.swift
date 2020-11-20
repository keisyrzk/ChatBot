//
//  MessageType.swift
//  ChatBot
//

import Foundation

/**
    This enum specifies what kind of message the user sends. It may be just a simple text but also an image or any other kind of data taht we would like to handle in the chat
 */
enum MessageType {
    
    case text(String)
    // case image(UIImage)
    // case data(some_data)
}
