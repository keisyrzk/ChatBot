//
//  UIDatePicker+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UIDatePicker {
    /// A publisher emitting date changes from this date picker.
    var datePublisher: AnyPublisher<Date, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.date)
                  .eraseToAnyPublisher()
    }
    
    /// A publisher emitting countdown duration changes from this date picker.
    var countDownDurationPublisher: AnyPublisher<TimeInterval, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.countDownDuration)
                  .eraseToAnyPublisher()
    }
}
