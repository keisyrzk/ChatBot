//
//  MainViewController.swift
//  ChatBot
//

import UIKit
import Combine

class MainViewController: UIViewController {

    @IBOutlet weak var oneOnOneButton: UIButton!
    @IBOutlet weak var oneToManyButton: UIButton!
    
    
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
