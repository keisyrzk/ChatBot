//
//  UIButton+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UIButton {
    /// A publisher emitting tap events from this button.
    var tapPublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchUpInside)
                  .eraseToAnyPublisher()
    }
    
    var touchDownPublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchDown)
                  .eraseToAnyPublisher()
    }
    
    var touchUpOutsidePublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchUpOutside)
                  .eraseToAnyPublisher()
    }
    
    var touchDragOutsidePublisher: AnyPublisher<Void, Never> {
        Publishers.ControlEvent(control: self, events: .touchDragOutside)
                  .eraseToAnyPublisher()
    }
}
