//
//  MainViewModel.swift
//  ChatBot
//

import Foundation

class MainViewModel {
    
    func generateSections() -> [GenericSectionModel] {
        
        let items = Array(ChatServices.shared.activeRooms)
        
        return [GenericSectionModel.WithoutHeader(title: "chatRooms",
                                                  items: [])]
    }
}
