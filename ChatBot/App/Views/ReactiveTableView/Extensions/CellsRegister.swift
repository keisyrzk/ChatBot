//
//  CellsRegister.swift
//  ReactiveTableView
//
//  Created by Esteban on 18/03/2020.
//  Copyright © 2020 Selfcode. All rights reserved.
//

import UIKit

extension ReactiveTableView {
    
    static let ChatMessageCellID = "ChatMessageCell"
    
    func registerCells() {

        self.register(UINib(nibName: "ChatMessageCell", bundle: nil), forCellReuseIdentifier: ReactiveTableView.ChatMessageCellID)
    }
}
