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
    
    @IBOutlet weak var leftSpaceConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSpaceConstraint: NSLayoutConstraint!
    
    
    private var chatMessageData: ChatMessageData!
    
    func configure(chatMessageData: ChatMessageData) {
        
        selectionStyle = .none
        messageView.backgroundColor = UIColor.clear
        self.chatMessageData = chatMessageData
        messageView.layer.cornerRadius = 10
                
        if chatMessageData.user.isMe {
            leftIconImageView.isHidden = true
            messageView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
            leftSpaceConstraint.constant = 35
            rightIconImageView.layer.cornerRadius = rightIconImageView.frame.height/2
            rightIconImageView.image = chatMessageData.user.image
        }
        else {
            rightIconImageView.isHidden = true
            messageView.backgroundColor = UIColor.orange.withAlphaComponent(0.2)
            rightSpaceConstraint.constant = 35
            leftIconImageView.layer.cornerRadius = leftIconImageView.frame.height/2
            leftIconImageView.image = chatMessageData.user.image
        }
        
        switch chatMessageData.messageType {
        case let .text(text):
            messageLabel.text = "\(chatMessageData.user.name)\n\(text)"
        }
        
        self.layoutIfNeeded()
    }
    
    override func prepareForReuse() {
        messageLabel.text = ""
        leftIconImageView.image = nil
        rightIconImageView.image = nil
        leftIconImageView.isHidden = false
        rightIconImageView.isHidden = false
        leftSpaceConstraint.constant = 5
        rightSpaceConstraint.constant = 5
    }
}
