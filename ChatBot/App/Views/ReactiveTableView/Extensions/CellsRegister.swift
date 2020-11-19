//
//  CellsRegister.swift
//  ReactiveTableView
//

import UIKit

extension ReactiveTableView {
    
    static let ChatMessageCellID = "ChatMessageCell"
    static let ChatRoomCellID = "ChatRoomCell"
    
    func registerCells() {

        self.register(UINib(nibName: "ChatMessageCell", bundle: nil), forCellReuseIdentifier: ReactiveTableView.ChatMessageCellID)
        self.register(UINib(nibName: "ChatRoomCell", bundle: nil), forCellReuseIdentifier: ReactiveTableView.ChatRoomCellID)
    }
}
