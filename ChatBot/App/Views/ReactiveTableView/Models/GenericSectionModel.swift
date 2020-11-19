//
//  GenericSectionModel.swift
//  ChatBot
//

import Foundation

enum GenericSectionModel {
    
    case WithoutHeader(title: String, items: [GenericSectionItem], canEdit: Bool)  //the title is used only for comparison purposes, it is not displayed
}

extension GenericSectionModel {
    typealias Item = GenericSectionItem
    typealias Identity = String
    
    var identity: String {
        switch self {
        case
            .WithoutHeader(title: let title, items: _, canEdit: _):
            return title
        }
    }
    
    var items: [GenericSectionItem] {
        switch  self {
        case .WithoutHeader(title: _, items: let items, canEdit: _):
            return items.map {$0}
        }
    }
    
    var canEdit: Bool {
        switch  self {
        case .WithoutHeader(title: _, items: _, canEdit: let canEdit):
            return canEdit
        }
    }
    
    init(original: GenericSectionModel, items: [Item]) {
        switch original {
        case let .WithoutHeader(title: title, items: _, canEdit: canEdit):
            self = .WithoutHeader(title: title, items: items, canEdit: canEdit)
        }
    }
}

func ==(lhs: GenericSectionModel, rhs: GenericSectionModel) -> Bool {
    return lhs.identity == rhs.identity && lhs.items == rhs.items
}
