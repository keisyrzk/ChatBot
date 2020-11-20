//
//  UIViewController.swift
//  ChatBot
//

import UIKit

extension UIViewController {
    
    /**
        Keyboard appearance handler
     */
    func setupKeyboard() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
    }
}
