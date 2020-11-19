//
//  ChatViewController.swift
//  ChatBot
//

import UIKit
import Combine

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: ReactiveTableView!
    
    private var viewModel: ChatViewModel!
    
    func assignDependencies(viewModel: ChatViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleRx()
    }
    
    private func handleRx() {
        
        
    }
}
