//
//  ChatRoomCell.swift
//  ChatBot
//

import UIKit

class ChatRoomCell: UITableViewCell {

    @IBOutlet weak var roomNameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    private var bag = CancellableBag()
    
    func configure(chatRoom: ChatRoom) {
        
        selectionStyle = .none
        bag = CancellableBag()
        lastMessageLabel.text = ""
        
        DispatchQueue.main.async {
            
            self.roomNameLabel.text = chatRoom.roomType.users.filter{ $0.isMe == false }.map{ $0.name }.joined(separator: " | ")
            
            switch chatRoom.receivedMessage.messageType {
            case let .text(text):
                self.lastMessageLabel.text = text
            }
            
            let usersCount = chatRoom.roomType.users.count
            if usersCount > 2 {
                self.iconImageView.image = UIImage(systemName: "person.3.fill")?.withRenderingMode(.alwaysTemplate)
                self.iconImageView.tintColor = UIColor.orange
                self.iconImageView.backgroundColor = UIColor.darkGray
            }
            else {
                self.iconImageView.image = chatRoom.roomType.users.filter{ $0.isMe == false }.first?.image
            }
    
            self.iconImageView.layer.cornerRadius = self.iconImageView.frame.height/2
        }
        
        ChatServices.shared.didReceiveMessage
            .sink { [weak self] (room) in
                if chatRoom.id == room.id {
                    switch room.receivedMessage.messageType {
                    case let .text(text):
                        self?.lastMessageLabel.text = text
                    }
                }
            }
            .dispose(by: bag)
    }
    
    override func prepareForReuse() {
        roomNameLabel.text = ""
        lastMessageLabel.text = ""
        iconImageView.image = nil
    }
}
