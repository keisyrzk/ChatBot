//
//  ChatMessageCell.swift
//  ChatBot
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    func configure(chatMessageData: ChatMessageData) {
        
        selectionStyle = .none
        
        switch chatMessageData.messageType {
        case let .text(text):
            messageLabel.text = "[\(chatMessageData.user.name)]\n\(text)"
        }
        
    }
}
