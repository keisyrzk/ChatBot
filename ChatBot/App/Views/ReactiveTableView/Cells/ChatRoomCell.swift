//
//  ChatRoomCell.swift
//  ChatBot
//

import UIKit

class ChatRoomCell: UITableViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    
    func configure(chatRoom: ChatRoom) {
        
        selectionStyle = .none
        
        roomNameLabel.text = chatRoom.roomType.users.map{ $0.name }.joined(separator: " :: ")
    }
}
