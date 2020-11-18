//
//  MainBuilder.swift
//  ChatBot
//

import UIKit

class MainBuilder {
        
    static func showIn(window: UIWindow) {
        
        DispatchQueue.main.async {
            window.rootViewController = create()
        }
    }
    
    static func create() -> UINavigationController {
        
        let navigator = UINavigationController()
                
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! MainViewController
        vc.title = "MAIN"
        
        navigator.show(vc, sender: nil)
        navigator.setViewControllers([vc], animated: false)
        
        return navigator
    }
}
