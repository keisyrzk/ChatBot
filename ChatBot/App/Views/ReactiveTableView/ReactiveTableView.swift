//
//  ReactiveTableView.swift
//  ChatBot
//

import UIKit
import Combine

class ReactiveTableView: UITableView, UITableViewDelegate {
    
    //MARK: Animations
    
    var deleteItemAnimation: UITableView.RowAnimation = .left
    var deleteSectionAnimation: UITableView.RowAnimation = .left
    var deleteSectionsAnimation: UITableView.RowAnimation = .left
    
    var appendItemsAnimation: UITableView.RowAnimation = .left
    var appendSectionsAnimation: UITableView.RowAnimation = .left
    
    var insertItemsAnimation: UITableView.RowAnimation = .left
    var insertSectionsAnimation: UITableView.RowAnimation = .left
    
    var updateItemsAnimation: UITableView.RowAnimation = .fade
    var updateSectionsAnimation: UITableView.RowAnimation = .fade
    
    
    //MARK: Attributes
    
    var sectionsObservable = CurrentValueSubject<[GenericSectionModel], Never>([])
    var customActionsObservable = PassthroughSubject<GenericTableAction, Never>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = 140
        
        self.delegate = self
        
        registerCells()
        setupTable()
    }
    
    private func setupTable() {
        
        self.delegate = self
        self.dataSource = self
        
        self.keyboardDismissMode = .onDrag
    }
}
