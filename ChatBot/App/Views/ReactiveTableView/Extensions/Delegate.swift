//
//  Delegate.swift
//  ChatBot
//

import UIKit
import Combine

extension ReactiveTableView {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = sectionsObservable.value[indexPath.section].items[indexPath.row]
        
        if let chatRoom = item.data as? ChatRoom {
            customActionsObservable.send(.SelectedRoom(chatRoom))
        }
    }
    
    //MARK: EDITING
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return sectionsObservable.value[indexPath.section].canEdit
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            deleteItem(indexPath: indexPath)
        default:
            break
        }
    }
}
