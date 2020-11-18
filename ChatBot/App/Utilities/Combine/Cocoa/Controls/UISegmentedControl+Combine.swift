//
//  UISegmentedControl+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UISegmentedControl {
    /// A publisher emitting selected segment index changes for this segmented control.
    var selectedSegmentIndexPublisher: AnyPublisher<Int, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.selectedSegmentIndex)
                  .eraseToAnyPublisher()
    }
}
