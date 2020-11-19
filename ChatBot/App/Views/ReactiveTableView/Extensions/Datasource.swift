//
//  Datasource.swift
//  ChatBot
//

import UIKit

extension ReactiveTableView: UITableViewDataSource {
    
    func setSections(sections: [GenericSectionModel]) {
        DispatchQueue.main.async { [weak self] in
            self?.sectionsObservable.send(sections)
            self?.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsObservable.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsObservable.value[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch sectionsObservable.value[indexPath.section].items[indexPath.item] {
                        
        case let .ChatMessageItem(title: _, chatMessageData: chatMessageData):
            let cell = tableView.dequeueReusableCell(withIdentifier: ReactiveTableView.ChatMessageCellID, for: indexPath) as! ChatMessageCell
            cell.configure(chatMessageData: chatMessageData)
            
            return cell
            
        case let .ChatRoomItem(title: _, chatRoom: chatRoom):
            let cell = tableView.dequeueReusableCell(withIdentifier: ReactiveTableView.ChatRoomCellID, for: indexPath) as! ChatRoomCell
            cell.configure(chatRoom: chatRoom)
            
            return cell
        }
    }
}
