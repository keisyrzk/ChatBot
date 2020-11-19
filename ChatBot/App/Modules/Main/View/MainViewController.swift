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
    
    private func handleRx() {
        
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
