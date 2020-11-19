//
//  ChatMessageCell.swift
//  ChatBot
//
//  Created by Esteban on 18/11/2020.
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    
    func configure(chatMessageData: ChatMessageData) {
        
        selectionStyle = .none
        
        switch chatMessageData.messageType {
        case let .text(text):
            messageLabel.text = text
        }
        
    }
}
