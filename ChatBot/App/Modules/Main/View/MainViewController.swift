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
                ChatBuilder.pushIn(navigator: self.navigationController!, chatType: .oneOnOne(UserData.generatedUser))
            }
            .dispose()
        
        oneToManyButton.tapPublisher
            .sink { (_) in
                ChatBuilder.pushIn(navigator: self.navigationController!, chatType: .oneToMany(UserData.generatedUsers))
            }
            .dispose()
    }

}
