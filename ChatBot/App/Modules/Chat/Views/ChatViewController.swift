//
//  ChatViewController.swift
//  ChatBot
//

import UIKit
import Combine

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: ReactiveTableView!
    
    private var viewModel: ChatViewModel!
    private var didReceiveMessageCancellable: Cancellable?
    
    func assignDependencies(viewModel: ChatViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        handleRx()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        didReceiveMessageCancellable?.cancel()
    }
    
    private func setup() {
        
        tableView.setSections(sections: viewModel.initSections())
    }
    
    private func handleRx() {
        
        didReceiveMessageCancellable = ChatServices.shared.didReceiveMessage
            .sink { [unowned self] (chatRoom) in
                if chatRoom.id == self.viewModel.chatRoom.id {
                    DispatchQueue.main.async {
                        self.tableView.append(items: [self.viewModel.createMessageItem(chatMessageData: chatRoom.receivedMessage)],
                                              toSection: 0)
                        self.tableView.scrollToBottom()
                    }
                }
            }
    }
}
