//
//  UIStepper+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UIStepper {
    /// A publisher emitting value changes for this stepper.
    var valuePublisher: AnyPublisher<Double, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.value)
                  .eraseToAnyPublisher()
    }
}
