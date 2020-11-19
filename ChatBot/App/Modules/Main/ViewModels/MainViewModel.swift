//
//  MainViewModel.swift
//  ChatBot
//

import Foundation

class MainViewModel {
    
    func generateSections() -> [GenericSectionModel] {
        
        let items: [GenericSectionItem] = Array(ChatServices.shared.activeRooms).map{ .ChatRoomItem(title: $0.id, chatRoom: $0) }
        
        return [GenericSectionModel.WithoutHeader(title: "chatRooms",
                                                  items: items)]
    }
}
