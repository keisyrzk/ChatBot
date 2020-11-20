//
//  ChatMessageCell.swift
//  ChatBot
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var messageView: ChatBubbleView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var leftIconImageView: UIImageView!
    @IBOutlet weak var rightIconImageView: UIImageView!
    
    func configure(chatMessageData: ChatMessageData) {
        
        selectionStyle = .none
        
        messageView.backgroundColor = UIColor.clear
        
            if chatMessageData.user.isMe {
                messageView.isIncoming = false
                leftIconImageView.isHidden = true
                rightIconImageView.layer.cornerRadius = rightIconImageView.frame.height/2
                rightIconImageView.image = chatMessageData.user.image
            }
            else {
                messageView.isIncoming = true
                rightIconImageView.isHidden = true
                leftIconImageView.layer.cornerRadius = leftIconImageView.frame.height/2
                leftIconImageView.image = chatMessageData.user.image
            }
            
            switch chatMessageData.messageType {
            case let .text(text):
                messageLabel.text = "[\(chatMessageData.user.name)]\n\(text)"
            }
            
            layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        messageLabel.text = ""
        leftIconImageView.image = nil
        rightIconImageView.image = nil
    }
}
