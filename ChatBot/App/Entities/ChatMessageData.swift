//
//  ChatMessageData.swift
//  ChatBot
//

import Foundation

/**
    Handles all the data arround the message - the user that is sending the data and the data itselff
 */
struct ChatMessageData {
    
    var user: User
    var messageType: MessageType
}
