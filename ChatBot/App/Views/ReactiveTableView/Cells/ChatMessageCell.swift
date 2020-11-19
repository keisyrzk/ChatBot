//
//  ChatMessageCell.swift
//  ChatBot
//

import UIKit

class ChatMessageCell: UITableViewCell {

    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var leftIconImageView: UIImageView!
    @IBOutlet weak var rightIconImageView: UIImageView!
    
    func configure(chatMessageData: ChatMessageData) {
        
        selectionStyle = .none
        
        DispatchQueue.main.async {
            
            if chatMessageData.user.isMe {
                self.leftIconImageView.isHidden = true
                self.rightIconImageView.layer.cornerRadius = self.rightIconImageView.frame.height/2
                self.rightIconImageView.image = chatMessageData.user.image
            }
            else {
                self.rightIconImageView.isHidden = true
                self.leftIconImageView.layer.cornerRadius = self.leftIconImageView.frame.height/2
                self.leftIconImageView.image = chatMessageData.user.image
            }
            
            switch chatMessageData.messageType {
            case let .text(text):
                self.messageLabel.text = "[\(chatMessageData.user.name)]\n\(text)"
            }
            
            self.layoutIfNeeded()
        }
    }
    
    override func prepareForReuse() {
        messageLabel.text = ""
        leftIconImageView.image = nil
        rightIconImageView.image = nil
    }
}
