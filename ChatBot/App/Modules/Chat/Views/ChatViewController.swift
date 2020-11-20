//
//  ChatViewController.swift
//  ChatBot
//

import UIKit
import Combine

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: ReactiveTableView!
    @IBOutlet weak var inputTextView: CombineTextView!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var bottomSpaceConstraint: NSLayoutConstraint!
    
    private var viewModel: ChatViewModel!
    private var didReceiveMessageCancellable: Cancellable?
    
    func assignDependencies(viewModel: ChatViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupKeyboard()
        setup()
        handleRx()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        didReceiveMessageCancellable?.cancel()
    }
    
    private func setup() {
        
        tableView.setSections(sections: viewModel.initSections())
        sendButton.layer.cornerRadius = 8
        inputTextView.text = "Message"
        inputTextView.textColor = UIColor.gray
        inputTextView.layer.borderWidth = 1
        inputTextView.layer.borderColor = UIColor.gray.cgColor
    }
    
    @objc override func keyboardWillShow(_ notification: Notification) {
        let userInfo = (notification as NSNotification).userInfo!
        let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let keyboardHeight = keyboardSize.height
        bottomSpaceConstraint.constant = keyboardHeight
    }
    
    @objc override func keyboardWillHide(_ notification: Notification) {
        bottomSpaceConstraint.constant = 0
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
        
        inputTextView.didBeginEditingPublisher
            .sink { [weak self] (_) in
                self?.inputTextView.text = ""
            }
            .dispose()
        
        inputTextView.didEndEditingPublisher
            .sink { [weak self] (_) in
                if self?.inputTextView.text == "" || self?.inputTextView.text == nil {
                    self?.inputTextView.text = "Message"
                    self?.inputTextView.textColor = UIColor.gray
                }
            }
            .dispose()
        
        inputTextView.textPublisher
            .sink { [weak self] (text) in
                if text?.isEmpty ?? true || text == nil {
                    self?.inputTextView.text = "Message"
                    self?.inputTextView.textColor = UIColor.gray
                    self?.sendButton.isEnabled = false
                }
                else if text!.contains("\n") {
                    self?.inputTextView.text = self?.inputTextView.text.replacingOccurrences(of: "\n", with: "")
                    self?.inputTextView.endEditing(true)
                }
                else {
                    self?.inputTextView.textColor = UIColor.black
                    self?.sendButton.isEnabled = true
                }
            }
            .dispose()
        
        sendButton.tapPublisher
            .sink { [unowned self] (_) in
                ChatServices.Requests.send(messageData: ChatMessageData(user: self.viewModel.chatRoom.meUser,
                                                                        messageType: .text(self.inputTextView.text)),
                                           to: self.viewModel.chatRoom)
                ChatServices.shared.restartBots(for: self.viewModel.chatRoom)
                self.inputTextView.text = ""
            }
            .dispose()
    }
}
