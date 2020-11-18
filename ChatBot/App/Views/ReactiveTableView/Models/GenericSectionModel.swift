//
//  GenericSectionModel.swift
//  ChatBot
//

import Foundation

enum GenericSectionModel {
    
    case WithoutHeader(title: String, items: [GenericSectionItem])  //the title is used only for comparison purposes, it is not displayed
}

extension GenericSectionModel {
    typealias Item = GenericSectionItem
    typealias Identity = String
    
    var identity: String {
        switch self {
        case
             .WithoutHeader(title: let title, items: _):
            return title
        }
    }
    
    var items: [GenericSectionItem] {
        switch  self {
        case .WithoutHeader(title: _, items: let items):
            return items.map {$0}
        }
    }
    
    init(original: GenericSectionModel, items: [Item]) {
        switch original {
        case let .WithoutHeader(title: title, items: _):
            self = .WithoutHeader(title: title, items: items)
        }
    }
}

func ==(lhs: GenericSectionModel, rhs: GenericSectionModel) -> Bool {
    return lhs.identity == rhs.identity && lhs.items == rhs.items
}
