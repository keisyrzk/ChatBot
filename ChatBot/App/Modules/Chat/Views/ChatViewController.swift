//
//  ChatViewController.swift
//  ChatBot
//
//  Created by Esteban on 18/11/2020.
//

import UIKit

class ChatViewController: UIViewController {

    private var viewModel: ChatViewModel!
    
    func assignDependencies(viewModel: ChatViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
