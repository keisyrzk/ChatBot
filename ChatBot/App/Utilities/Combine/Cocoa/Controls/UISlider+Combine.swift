//
//  UISlider+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UISlider {
    /// A publisher emitting value changes for this slider.
    var valuePublisher: AnyPublisher<Float, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.value)
                  .eraseToAnyPublisher()
    }
}
