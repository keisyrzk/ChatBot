//
//  UITextView+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UITextView {
    /// A publisher emitting any text changes to a this text view.
    var textPublisher: AnyPublisher<String?, Never> {
        (self as! CombineTextView).rx.textPublisher(for: self)
    }
    
    var didBeginEditingPublisher: AnyPublisher<Void, Never> {
        (self as! CombineTextView).rx.textDidBeginEditingPublisher(for: self)
    }
    
    var didEndEditingPublisher: AnyPublisher<Void, Never> {
        (self as! CombineTextView).rx.textDidEndEditingPublisher(for: self)
    }
}
