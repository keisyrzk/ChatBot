//
//  UITextField+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UITextField {
    /// A publisher emitting any text changes to a this text field.
    var textPublisher: AnyPublisher<String?, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.text)
                  .eraseToAnyPublisher()
    }
    
    /// A publisher emitting any attributed text changes to this text field.
    var attributedTextPublisher: AnyPublisher<NSAttributedString?, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.attributedText)
                  .eraseToAnyPublisher()
    }
    
    /// A publisher that emits whenever the user taps the return button and ends the editing on the text field.
    var returnPublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .editingDidEndOnExit)
                  .eraseToAnyPublisher()
    }
    
    /// A publisher that emits for a given Event
    func controlEventPublisher(event: UIControl.Event) -> AnyPublisher<Void, Never> {
        return Publishers.ControlEvent(control: self, events: event).eraseToAnyPublisher()
    }
}
