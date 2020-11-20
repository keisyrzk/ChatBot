//
//  ChatBot.swift
//  ChatBot
//

import Foundation

/**
    ChatBot responds with a random, `not repeating`, text in a random time intervals (`0.5 ... 5)` each time. It will send the messages in a random amount `(5 ... number_of_texts)`.
 */
class ChatBot: User {
    
    // MARK: Attributes
    
    private static let texts = [
        "Hey! How are you doing? :)",
        "Do you want play tennis next sunday?",
        "What do you think about pub crawling this friday night?",
        "I am so excited!",
        ":(",
        ":)",
        "Would you like to date with me?",
        "I do really like you",
        "wow, this is amazing!"
    ]
    
    private var textsCopy = ChatBot.texts
    private var timer: Timer?
    private var messagData: ChatMessageData {
        return ChatMessageData(user: self, messageType: .text(randomText))
    }
    
    /**
        Get random text to send
     */
    var randomText: String {
        return textsCopy.remove(at: Int.random(in: 0...textsCopy.count - 1))
    }
    
    /**
        Get random response interval
     */
    var randomInterval: Double {
        return Double.random(in: 0.5...5.0)
    }
    
    /**
        Max number of messages
     */
    private var maxMessagesCount = Int.random(in: (5...ChatBot.texts.count - 1))
    private var currentMessagesCount = 0
    
    /**
        Room in which the bot participates
     */
    var chatRoom: ChatRoom!
    
    
    // MARK: Logic
    
    func activate(chatRoom: ChatRoom) {
        self.chatRoom = chatRoom
        scheduleTimer()
    }
    
    func deactivate() {
        timer?.invalidate()
        textsCopy = ChatBot.texts
    }
    
    func restart() {
        deactivate()
        currentMessagesCount = 0
        scheduleTimer()
    }
    
    private func scheduleTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: randomInterval, repeats: false) { [weak self] timer in
            ChatServices.Requests.send(messageData: self!.messagData, to: self!.chatRoom)
            
            self?.currentMessagesCount += 1
            if self?.currentMessagesCount == self?.maxMessagesCount {
                self?.deactivate()
            }
            else {
                self?.scheduleTimer()
            }
        }
    }
}
