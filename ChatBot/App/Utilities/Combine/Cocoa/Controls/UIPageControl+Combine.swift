//
//  UIPageControl+Combine.swift
//  ChatBot
//

import Combine
import UIKit

public extension UIPageControl {
    /// A publisher emitting current page changes for this page control.
    var currentPagePublisher: AnyPublisher<Int, Never> {
        Publishers.ControlProperty(control: self, events: .defaultValueEvents, keyPath: \.currentPage)
                  .eraseToAnyPublisher()
    }
}
