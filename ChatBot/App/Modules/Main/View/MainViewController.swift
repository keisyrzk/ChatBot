//
//  MainViewController.swift
//  ChatBot
//

import UIKit
import Combine

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: ReactiveTableView!
    @IBOutlet weak var oneOnOneButton: UIButton!
    @IBOutlet weak var oneToManyButton: UIButton!
    
    private var viewModel: MainViewModel!
    
    func assignDependencies(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        handleRx()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.async { [weak self] in
            self?.tableView.setSections(sections: self!.viewModel.generateSections())
        }
    }
    
    private func handleRx() {
        
        tableView.customActionsObservable
            .sink { [unowned self] (action) in
                switch action {
                case let .SelectedRoom(chatRoom):
                    DispatchQueue.main.async {
                        ChatBuilder.pushIn(navigator: self.navigationController!, chatRoom: chatRoom)
                    }
                    
                default:
                    break
                }
            }
            .dispose()
        
        oneOnOneButton.tapPublisher
            .sink { (_) in
                ChatBuilder.pushIn(navigator: self.navigationController!,
                                   chatRoom: ChatServices.shared.createRoom(roomType: .oneOnOne(users: UserData.generatedOneOnOneUsers,
                                                                                                    roomId: String.randomAlphanumeric())))
            }
            .dispose()
        
        oneToManyButton.tapPublisher
            .sink { (_) in
                ChatBuilder.pushIn(navigator: self.navigationController!,
                                   chatRoom: ChatServices.shared.createRoom(roomType: .oneToMany(users: UserData.generatedOneToManyUsers,
                                                                                                     roomId: String.randomAlphanumeric())))
            }
            .dispose()
    }

}
